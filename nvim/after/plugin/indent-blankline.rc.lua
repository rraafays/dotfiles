local status, blankline = pcall(require, 'indent_blankline')
if (not status) then return end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#665c54 gui=nocombine]]

blankline.setup {
  char_highlight_list = { "IndentBlanklineIndent1" }
}
