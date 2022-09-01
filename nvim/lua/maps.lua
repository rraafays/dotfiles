-- shortens vim.keymap to just keymap by redifining it in lua
local keymap = vim.keymap

-- lazy command entry
keymap.set('n', ';', ':')

-- don't yank with x in normal mode
keymap.set('n', 'x', '"_x')

-- increment & decrement value in normal mode
keymap.set('n', '=', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- new tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- split window
keymap.set('', 'sh', ':split<Return><C-w>w', { silent = true })
keymap.set('', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- navigate window
keymap.set('', '<C-left>', '<C-w>h')
keymap.set('', '<C-up>', '<C-w>k')
keymap.set('', '<C-down>', '<C-w>j')
keymap.set('', '<C-right>', '<C-w>l')

-- resize window
keymap.set('n', '<C-A-left>', '<C-w><')
keymap.set('n', '<C-A-right>', '<C-w>>')
keymap.set('n', '<C-A-up>', '<C-w>+')
keymap.set('n', '<C-A-down>', '<C-w>-')
