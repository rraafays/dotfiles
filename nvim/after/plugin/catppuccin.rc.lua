local status, n = pcall(require, 'catppuccin')
if (not status) then return end

n.setup({ comment_italics = true })
vim.g.catppuccin_flavour = "mocha"

require('catppuccin').setup()
vim.cmd [[colorscheme catppuccin]]
