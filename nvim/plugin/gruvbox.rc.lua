local status, n = pcall(require, 'gruvbox')
if (not status) then return end

n.setup({ comment_italics = true })

require('gruvbox').setup({
  italic = { strings = false, operators = false, comments = true },
  invert_selection = true,
})
vim.cmd [[ colorscheme gruvbox ]]
