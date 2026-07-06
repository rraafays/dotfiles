-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.strudel-filetype").setup()

if vim.env.TMUX then
  require("config.tmux-nav")
end
