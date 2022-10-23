local status, n = pcall(require, 'gruvbox')
if (not status) then return end

n.setup({ comment_italics = true })

require('gruvbox').setup({
  italic = false,
  invert_selection = true,
})
vim.cmd [[colorscheme gruvbox]]
