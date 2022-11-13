-- shortens vim.keymap to just keymap by redifining it in lua
local keymap = vim.keymap

-- lazy command entry
keymap.set('n', ';', ':')

-- don't yank with x in normal mode
keymap.set('n', 'x', '"_x')

-- increment & decrement value in normal mode
keymap.set('n', '=', '<C-a>')
keymap.set('n', '-', '<C-x>')
-- increment & decrement value by 10 in normal mode
keymap.set('n', '+', '10<C-a>')
keymap.set('n', '_', '10<C-x>')
-- increment & decrement value by 2 in normal mode
keymap.set('n', '<C-=>', '2<C-a>')
keymap.set('n', '<C-->', '2<C-x>')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- new tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- split window
keymap.set('', 'sh', ':split<Return><C-w>w', { silent = true })
keymap.set('', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- window navigation
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-h>', '<C-w>h')

-- navigate current word occurances easier
keymap.set('n', '.', '*')
keymap.set('n', ',', '#')
