-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.env.TMUX then
  require("config.tmux-nav")
end
