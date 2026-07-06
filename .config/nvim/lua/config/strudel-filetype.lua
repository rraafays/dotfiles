-- Lightweight Strudel filetype registration and ts_ls guards. No Nix, npm, or LSP at startup.
-- Heavy Strudel setup loads via config.strudel-lsp (on FileType) and gruvw/strudel.nvim (lazy ft).
local M = {}

function M.setup()
  vim.filetype.add({
    extension = {
      str = "strudel",
      std = "strudel",
    },
  })

  pcall(vim.treesitter.language.register, "javascript", "strudel")

  local strudel_lsp = require("config.strudel-lsp")
  local group = vim.api.nvim_create_augroup("StrudelFiletype", { clear = true })
  local patterns = { "*.str", "*.std" }

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group,
    pattern = patterns,
    callback = function(event)
      vim.schedule(function()
        if not vim.api.nvim_buf_is_valid(event.buf) then
          return
        end
        vim.bo[event.buf].filetype = "strudel"
        strudel_lsp.detach_js_ls(event.buf)
      end)
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function(event)
      if strudel_lsp.is_strudel_buffer(event.buf) then
        vim.bo[event.buf].filetype = "strudel"
        strudel_lsp.detach_js_ls(event.buf)
      end
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "strudel",
    callback = function(event)
      strudel_lsp.detach_js_ls(event.buf)
      strudel_lsp.activate()
    end,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(event)
      if not strudel_lsp.is_strudel_buffer(event.buf) then
        return
      end
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and strudel_lsp.is_js_lsp(client.name) then
        vim.lsp.stop_client(client.id, true)
      end
    end,
  })

  vim.api.nvim_create_user_command("StrudelLspBuild", function()
    strudel_lsp.activate()
    if strudel_lsp.build({ force = true, notify = true }) then
      strudel_lsp.setup_lsp()
    end
  end, { desc = "Build Strudel LSP (npm + strudel-core.d.ts) via Nix" })
end

return M
