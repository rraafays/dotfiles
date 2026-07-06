-- Fast tmux-aware split navigation for Neovim.
-- Tmux uses the @vim pane flag (see M.setup()) instead of ps/grep on each keypress.
-- Depends on Alt+arrow bindings in config/keymaps.lua and ~/.config/tmux/tmux.conf.

local M = {}

local TMUX_SELECT = {
  h = "L",
  j = "D",
  k = "U",
  l = "R",
}

---@type { exe?: string, socket?: string, setup?: boolean }
local cached = {}

---@param args string[]
local function tmux(args)
  if not vim.env.TMUX then
    return
  end

  if not cached.exe then
    cached.exe = vim.fn.exepath("tmux") ~= "" and vim.fn.exepath("tmux") or "tmux"
  end
  if not cached.socket then
    cached.socket = vim.split(vim.env.TMUX, ",")[1]
  end

  vim.system({ cached.exe, "-S", cached.socket, unpack(args) }):wait()
end

--- Mark this tmux pane as running Neovim so tmux forwards Alt+arrow keys here.
---@param enabled boolean
function M.set_vim_pane_flag(enabled)
  if not vim.env.TMUX_PANE then
    return
  end

  tmux({ "set-option", "-p", "-t", vim.env.TMUX_PANE, "@vim", enabled and "1" or "0" })
end

---@param direction "h"|"j"|"k"|"l"
function M.navigate(direction)
  local from_winnr = vim.fn.winnr()
  vim.cmd("wincmd " .. direction)

  if vim.fn.winnr() == from_winnr and vim.env.TMUX then
    local select_flag = TMUX_SELECT[direction]
    if select_flag then
      tmux({ "select-pane", "-t", vim.env.TMUX_PANE, "-" .. select_flag })
    end
  end
end

function M.setup()
  if cached.setup then
    return
  end
  cached.setup = true

  local group = vim.api.nvim_create_augroup("TmuxNav", { clear = true })

  vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    group = group,
    callback = function()
      M.set_vim_pane_flag(true)
    end,
  })

  vim.api.nvim_create_autocmd("VimLeave", {
    group = group,
    callback = function()
      M.set_vim_pane_flag(false)
    end,
  })

  -- Keymaps load on VeryLazy; mark immediately if we are already inside tmux.
  M.set_vim_pane_flag(true)
end

M.setup()

return M
