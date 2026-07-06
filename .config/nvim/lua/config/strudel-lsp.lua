-- Strudel LSP: completion/hover for .str / .std via a custom TypeScript-backed language server.
-- Loaded lazily (see lua/plugins/strudel-lsp.lua) when a strudel buffer is opened.
-- Depends on config.strudel-nix (Nix shell), strudel/lsp/server.mjs, and generated strudel-core.d.ts.
local M = {}

local lsp_dir = vim.fn.stdpath("config") .. "/strudel/lsp"
local server_script = lsp_dir .. "/server.mjs"
local types_file = lsp_dir .. "/strudel-core.d.ts"
local marker = lsp_dir .. "/node_modules/typescript/package.json"

local building = false
local activated = false
local deactivate_group = nil

local JS_LSP_SERVERS = {
  ts_ls = true,
  denols = true,
  eslint = true,
  vtsls = true,
  ["typescript-tools"] = true,
}

function M.is_js_lsp(name)
  return JS_LSP_SERVERS[name] == true
end

function M.is_strudel_buffer(bufnr)
  bufnr = bufnr or 0
  local name = vim.api.nvim_buf_get_name(bufnr)
  return name:match("%.str$") ~= nil or name:match("%.std$") ~= nil
end

--- Stop JS/TS LSPs that cannot parse .str buffers (ts_ls documentHighlight etc.).
function M.detach_js_ls(bufnr)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if JS_LSP_SERVERS[client.name] then
      vim.lsp.stop_client(client.id, true)
    end
  end
end

function M.lsp_dir()
  return lsp_dir
end

function M.types_installed()
  return vim.fn.filereadable(types_file) == 1
end

function M.deps_installed()
  return vim.fn.filereadable(marker) == 1
end

local function strudel_buffer_count()
  local count = 0
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].filetype == "strudel" then
      count = count + 1
    end
  end
  return count
end

--- @param opts? { force?: boolean, notify?: boolean }
--- @return boolean
function M.build(opts)
  opts = vim.tbl_extend("force", { force = false, notify = true }, opts or {})
  local strudel_nix = require("config.strudel-nix")

  if not strudel_nix.check_nix() then
    if opts.notify then
      vim.notify("Strudel LSP: Nix is required", vim.log.levels.ERROR)
    end
    return false
  end

  if building then
    if opts.notify then
      vim.notify("Strudel LSP: build already in progress", vim.log.levels.INFO)
    end
    return false
  end

  if not opts.force and M.deps_installed() and M.types_installed() then
    return true
  end

  building = true
  strudel_nix.apply_path()

  if opts.notify then
    vim.notify("Strudel LSP: installing dependencies via Nix…", vim.log.levels.INFO)
  end

  local shell_nix = strudel_nix.shell_nix_path()
  local nix_shell = strudel_nix.find_nix_shell()

  local install = vim.system({ nix_shell, shell_nix, "--run", "npm ci" }, { cwd = lsp_dir, text = true }):wait()
  if install.code ~= 0 then
    building = false
    if opts.notify then
      vim.notify("Strudel LSP: npm ci failed", vim.log.levels.ERROR)
    end
    return false
  end

  local generate = vim.system({ nix_shell, shell_nix, "--run", "node generate-types.mjs" }, { cwd = lsp_dir, text = true }):wait()
  building = false

  if generate.code ~= 0 then
    if opts.notify then
      vim.notify("Strudel LSP: failed to generate strudel-core.d.ts", vim.log.levels.ERROR)
    end
    return false
  end

  if opts.notify then
    vim.notify("Strudel LSP: ready", vim.log.levels.INFO)
  end
  return true
end

function M.setup_lsp()
  if not vim.lsp.config then
    vim.notify("Strudel LSP: Neovim 0.11+ lsp.config API required", vim.log.levels.WARN)
    return false
  end

  if not M.deps_installed() or not M.types_installed() then
    return false
  end

  local strudel_nix = require("config.strudel-nix")
  if not strudel_nix.apply_path() then
    return false
  end

  vim.lsp.config("strudel_ls", {
    cmd = { "node", server_script },
    filetypes = { "strudel" },
    root_dir = function(bufnr, on_dir)
      local fname = vim.api.nvim_buf_get_name(bufnr)
      on_dir(vim.fs.root(fname, { ".git" }) or vim.fn.fnamemodify(fname, ":h"))
    end,
    settings = {},
  })

  vim.lsp.enable("strudel_ls", true)
  return true
end

function M.deactivate()
  if vim.lsp.config then
    pcall(vim.lsp.enable, "strudel_ls", false)
  end

  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.name == "strudel_ls" then
      vim.lsp.stop_client(client.id, true)
    end
  end
end

local function bootstrap_async()
  if M.deps_installed() and M.types_installed() then
    if strudel_buffer_count() > 0 then
      M.setup_lsp()
    end
    return
  end

  vim.schedule(function()
    if M.build({ notify = true }) and strudel_buffer_count() > 0 then
      M.setup_lsp()
    end
  end)
end

local function setup_deactivate_autocmd()
  if deactivate_group then
    return
  end

  deactivate_group = vim.api.nvim_create_augroup("StrudelLspDeactivate", { clear = true })
  vim.api.nvim_create_autocmd({ "BufLeave", "BufDelete" }, {
    group = deactivate_group,
    callback = function()
      vim.schedule(function()
        if strudel_buffer_count() == 0 then
          M.deactivate()
        end
      end)
    end,
  })
end

--- Start Strudel LSP when a strudel buffer is opened; idempotent for autocmds, re-enables after deactivate.
function M.activate()
  if not activated then
    activated = true
    setup_deactivate_autocmd()
  end
  bootstrap_async()
end

return M
