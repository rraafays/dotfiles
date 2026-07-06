-- Loads christoomey/vim-tmux-navigator so Neovim can hand off split navigation to tmux.
-- Depends on Alt+arrow key bindings in config/keymaps.lua and ~/.config/tmux/tmux.conf.
-- Plugin default mappings are disabled; keymaps.lua defines Alt+Left/Down/Up/Right instead.
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
