-- shortens vim.keymap to just keymap by redifining it in lua
local keymap = vim.keymap

-- lazy command entry
keymap.set('n', ';', ':')

-- lazy leave
keymap.set('n', 'q', ':q<CR>')

-- force quit
keymap.set('n', '<C-c>', '<Esc>:qa!<CR>')
keymap.set('i', '<C-c>', '<Esc>:qa!<CR>')

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

-- unhighlight search
keymap.set('n', '÷', ':nohlsearch<CR>')

-- navigate current word occurances easier
keymap.set('n', '.', '*')
keymap.set('n', ',', '#')

-- unmap arrow keys
keymap.set('', '<Up>', '<Nop>')
keymap.set('', '<Right>', '<Nop>')
keymap.set('', '<Down>', '<Nop>')
keymap.set('', '<Left>', '<Nop>')
keymap.set('i', '<Up>', '<Nop>')
keymap.set('i', '<Right>', '<Nop>')
keymap.set('i', '<Down>', '<Nop>')
keymap.set('i', '<Left>', '<Nop>')
