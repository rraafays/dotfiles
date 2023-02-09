local status, ufo = pcall(require, 'ufo')
if (not status) then return end

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', '<Tab>', 'za')

ufo.setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
  open_fold_hl_timeout = 0
}
