local status, ufo = pcall(require, 'ufo')
if (not status) then return end

vim.o.foldenable = true
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.keymap.set('n', '<Tab>', 'za')
vim.keymap.set('n', '<S-Tab>', 'zA')

require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
