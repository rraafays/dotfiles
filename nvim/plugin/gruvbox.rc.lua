local status, gruvbox = pcall(require, 'gruvbox')
if (not status) then return end

gruvbox.setup({
  italic = { strings = false, operators = false, comments = false },
  invert_selection = true,
})
vim.cmd [[ colorscheme gruvbox ]]
