local status, n = pcall(require, 'gruvbox')
if (not status) then return end

n.setup({ comment_italics = true })

require('gruvbox').setup()
vim.cmd [[colorscheme gruvbox]]
