-- Bootstraps strudel.nvim on Nix-enabled machines: Node via shell.nix, npm deps, Chrome checks.
-- Used by lua/plugins/strudel.lua for lazy.nvim build, startup bootstrap, and launch guards.
local M = {}

local shell_nix = vim.fn.stdpath("config") .. "/strudel/shell.nix"
local CHROME_MAC = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
local BROWSER_DATA_DIR = vim.fn.expand("~/.cache/strudel-nvim")
local PUPPETEER_MARKER = "node_modules/puppeteer/package.json"
local NPM_CI = "PUPPETEER_SKIP_DOWNLOAD=1 npm ci"
local PROFILE_LOCK_FILES = { "SingletonLock", "SingletonSocket", "SingletonCookie" }

-- Resolved once per session; nix-shell startup is slow.
local nix_shell_bin = nil
local building = false
local bootstrap_running = false

local NIX_SHELL_CANDIDATES = {
  "nix-shell",
  "/nix/var/nix/profiles/default/bin/nix-shell",
}

--- Default Google Chrome path on macOS (user must install Chrome separately).
function M.chrome_path()
  return CHROME_MAC
end

function M.shell_nix_path()
  return shell_nix
end

function M.browser_data_dir()
  return BROWSER_DATA_DIR
end

--- @param pid number
--- @return boolean
local function pid_alive(pid)
  if not pid or pid <= 0 then
    return false
  end
  vim.fn.system({ "kill", "-0", tostring(pid) })
  return vim.v.shell_error == 0
end

--- Remove Chrome profile lock files left behind when a session exits uncleanly.
function M.remove_profile_locks(data_dir)
  data_dir = data_dir or BROWSER_DATA_DIR
  for _, name in ipairs(PROFILE_LOCK_FILES) do
    local path = data_dir .. "/" .. name
    local stat = vim.uv.fs_lstat(path)
    if stat then
      vim.uv.fs_unlink(path)
    end
  end
end

--- Stop Chrome processes and clear locks for the Strudel profile when Neovim has no active session.
--- @param opts? { notify?: boolean }
function M.cleanup_orphan_browser(opts)
  opts = vim.tbl_extend("force", { notify = false }, opts or {})
  local data_dir = M.browser_data_dir()
  local pattern = "user-data-dir=" .. data_dir

  local pgrep = vim.system({ "pgrep", "-f", pattern }, { text = true }):wait()
  local pids = pgrep.stdout and vim.split(vim.trim(pgrep.stdout), "\n", { plain = true }) or {}

  if #pids > 0 and pids[1] ~= "" then
    if opts.notify then
      vim.notify("Strudel: stopping leftover Chrome session…", vim.log.levels.INFO)
    end
    vim.system({ "pkill", "-f", pattern }, { text = true }):wait()
    vim.fn.sleep(500)
  end

  local lock = data_dir .. "/SingletonLock"
  local lock_stat = vim.uv.fs_lstat(lock)
  if lock_stat then
    local target = vim.uv.fs_readlink(lock)
    local lock_pid = target and tonumber(target:match("(%d+)$")) or nil
    if not lock_pid or not pid_alive(lock_pid) then
      M.remove_profile_locks(data_dir)
    end
  end
end

--- Locate nix-shell when Neovim is launched outside a login shell (common on macOS).
function M.find_nix_shell()
  if nix_shell_bin then
    return nix_shell_bin
  end

  for _, candidate in ipairs(NIX_SHELL_CANDIDATES) do
    if vim.fn.executable(candidate) == 1 then
      nix_shell_bin = candidate == "nix-shell" and vim.fn.exepath("nix-shell") or candidate
      return nix_shell_bin
    end
  end

  local home = vim.env.HOME or vim.fn.expand("~")
  local profile_bin = home .. "/.nix-profile/bin/nix-shell"
  if vim.fn.executable(profile_bin) == 1 then
    nix_shell_bin = profile_bin
    return nix_shell_bin
  end

  return nil
end

--- @return boolean ok
--- @return string? err
function M.check_nix()
  if not M.find_nix_shell() then
    return false, "nix-shell not found; install Nix (https://nixos.org/download.html)"
  end
  if vim.fn.filereadable(shell_nix) ~= 1 then
    return false, "Strudel shell.nix missing: " .. shell_nix
  end
  return true, nil
end

--- @return boolean ok
--- @return string? err
function M.check_chrome()
  if vim.fn.executable(M.chrome_path()) ~= 1 then
    return false,
      "Google Chrome not found at "
        .. M.chrome_path()
        .. ". Install Chrome for macOS, then retry."
  end
  return true, nil
end

function M.deps_installed(plugin_dir)
  return vim.fn.filereadable(plugin_dir .. "/" .. PUPPETEER_MARKER) == 1
end

--- Prepend Node from the Strudel Nix shell to Neovim's PATH (used by jobstart).
function M.apply_path()
  local ok, err = M.check_nix()
  if not ok then
    vim.notify("Strudel: " .. err, vim.log.levels.ERROR)
    return false
  end

  local nix_shell = M.find_nix_shell()
  local out = vim.fn.system({ nix_shell, shell_nix, "--run", "echo -n $PATH" })
  if vim.v.shell_error ~= 0 then
    vim.notify("Strudel: failed to enter Nix shell for PATH", vim.log.levels.ERROR)
    return false
  end

  vim.env.PATH = vim.trim(out) .. ":" .. (vim.env.PATH or "")
  return true
end

--- Install Puppeteer/npm deps inside the plugin directory via Nix Node.
--- @param plugin_dir string
--- @param opts? { force?: boolean, notify?: boolean }
--- @return boolean ok
function M.build(plugin_dir, opts)
  opts = vim.tbl_extend("force", { force = false, notify = true }, opts or {})

  local ok, err = M.check_nix()
  if not ok then
    if opts.notify then
      vim.notify("Strudel: " .. err, vim.log.levels.ERROR)
    end
    return false
  end

  if not opts.force and M.deps_installed(plugin_dir) then
    return true
  end

  if building then
    return false
  end
  building = true

  if not M.apply_path() then
    building = false
    return false
  end

  if opts.notify then
    vim.notify("Strudel: installing npm dependencies via Nix…", vim.log.levels.INFO)
  end

  local nix_shell = M.find_nix_shell()
  local result = vim.system({ nix_shell, shell_nix, "--run", NPM_CI }, { cwd = plugin_dir, text = true }):wait()

  if result.code ~= 0 then
    local detail = (result.stderr or result.stdout or ""):gsub("^%s+", ""):gsub("%s+$", "")
    building = false
    if opts.notify then
      vim.notify(
        "Strudel: npm install failed"
          .. (detail ~= "" and (": " .. detail:sub(1, 200)) or "")
          .. ". Try :StrudelBuild",
        vim.log.levels.ERROR
      )
    end
    return false
  end

  if opts.notify then
    vim.notify("Strudel: npm dependencies installed", vim.log.levels.INFO)
  end
  building = false
  return true
end

--- Background bootstrap after clone/sync so the first launch is usually instant.
function M.bootstrap_async(plugin_dir)
  if M.deps_installed(plugin_dir) then
    M.apply_path()
    return
  end

  if bootstrap_running or building then
    return
  end
  bootstrap_running = true

  vim.schedule(function()
    if not M.check_nix() then
      bootstrap_running = false
      return
    end

    vim.notify("Strudel: first-run setup (npm via Nix)…", vim.log.levels.INFO)
    local ok = M.build(plugin_dir, { notify = false })
    bootstrap_running = false

    if ok then
      vim.notify("Strudel: ready — open a .str file and press <leader>Zl", vim.log.levels.INFO)
    else
      vim.notify("Strudel: setup failed — run :StrudelBuild", vim.log.levels.ERROR)
    end
  end)
end

--- Verify Nix, Chrome, and npm deps before starting a browser session.
--- @param plugin_dir string
--- @return boolean ok
function M.ensure_ready(plugin_dir)
  local ok, err = M.check_nix()
  if not ok then
    vim.notify("Strudel: " .. err, vim.log.levels.ERROR)
    return false
  end

  ok, err = M.check_chrome()
  if not ok then
    vim.notify("Strudel: " .. err, vim.log.levels.ERROR)
    return false
  end

  if bootstrap_running then
    vim.notify("Strudel: still installing npm dependencies, try again shortly", vim.log.levels.WARN)
    return false
  end

  if building then
    vim.notify("Strudel: still installing npm dependencies, try again shortly", vim.log.levels.WARN)
    return false
  end

  if not M.deps_installed(plugin_dir) then
    return M.build(plugin_dir, { notify = true })
  end

  return M.apply_path()
end

--- Guard strudel.launch with prerequisite checks and auto-build.
function M.wrap_launch(strudel, plugin_dir)
  return function()
    if strudel.is_launched() then
      vim.notify("Strudel is already running — use :StrudelQuit first", vim.log.levels.WARN)
      return
    end

    if not M.ensure_ready(plugin_dir) then
      return
    end

    M.cleanup_orphan_browser({ notify = true })
    strudel.launch()
  end
end

--- Quit Strudel and tear down any leftover Chrome profile processes.
function M.wrap_quit(strudel)
  return function()
    if strudel.is_launched() then
      strudel.quit()
    else
      M.cleanup_orphan_browser({ notify = true })
    end
  end
end

--- Close the Strudel session when Neovim exits to avoid orphaned Chrome processes.
function M.setup_lifecycle(strudel)
  local group = vim.api.nvim_create_augroup("StrudelLifecycle", { clear = true })
  vim.api.nvim_create_autocmd({ "VimLeavePre", "QuitPre" }, {
    group = group,
    callback = function()
      if strudel.is_launched() then
        strudel.quit()
      end
    end,
  })
end

--- Print setup status (also invoked by :StrudelHealth).
function M.health(plugin_dir)
  local lines = {}
  local function add(level, msg)
    lines[#lines + 1] = { msg, level }
  end

  local ok, err = M.check_nix()
  add(ok and "DiagnosticOk" or "DiagnosticError", ok and "Nix: OK" or ("Nix: " .. err))

  ok, err = M.check_chrome()
  add(ok and "DiagnosticOk" or "DiagnosticWarn", ok and "Chrome: OK" or ("Chrome: " .. err))

  if plugin_dir and plugin_dir ~= "" then
    add(
      M.deps_installed(plugin_dir) and "DiagnosticOk" or "DiagnosticWarn",
      M.deps_installed(plugin_dir) and "npm deps: installed" or "npm deps: missing (run :StrudelBuild)"
    )
  end

  if M.apply_path() then
    local node_ver = vim.fn.system({ "node", "--version" })
    if vim.v.shell_error == 0 then
      add("DiagnosticOk", "Node: " .. vim.trim(node_ver))
    end
  end

  for _, line in ipairs(lines) do
    vim.api.nvim_echo({ line }, true, {})
  end
end

return M
