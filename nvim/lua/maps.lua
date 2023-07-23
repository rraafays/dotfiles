-- shortens vim.keymap to just keymap by redifining it in lua
local keymap = vim.keymap

-- lazy command
keymap.set("n", ";", ":")

-- lazy leave
keymap.set("n", "q", ":q<CR>")

-- force quit
keymap.set("n", "<C-c>", "<Esc>:qa!<CR>")
keymap.set("i", "<C-c>", "<Esc>:qa!<CR>")

-- don't yank on delete
keymap.set("n", "x", '"_x')
keymap.set("n", "d", '"_d')

-- increment & decrement value in normal mode
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- increment & decrement value by 10 in normal mode
keymap.set("n", "+", "10<C-a>")
keymap.set("n", "_", "10<C-x>")
-- increment & decrement value by 2 in normal mode
keymap.set("n", "<C-=>", "2<C-a>")
keymap.set("n", "<C-->", "2<C-x>")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- unhighlight search
keymap.set("n", "\\", ":nohlsearch<CR>")

-- navigate current word occurances easier
keymap.set("n", ".", "*")
keymap.set("n", ",", "#")

-- quick line del in normal mode
keymap.set("n", "<BS>", "dd")

-- join to line above
keymap.set("n", "K", "kJ")

-- v-block on alt
keymap.set("n", "<A-v>", "<C-v>")

-- map arrows to pane nav
keymap.set("n", "<Up>", ":wincmd k<CR>")
keymap.set("n", "<Right>", ":wincmd l<CR>")
keymap.set("n", "<Down>", ":wincmd j<CR>")
keymap.set("n", "<Left>", ":wincmd h<CR>")
keymap.set("t", "<Up>", "<cmd> wincmd k<CR>")
keymap.set("t", "<Right>", "<cmd> wincmd l<CR>")
keymap.set("t", "<Down>", "<cmd> wincmd j<CR>")
keymap.set("t", "<Left>", "<cmd> wincmd h<CR>")

-- insert arrows
keymap.set("i", "<Up>", "￪")
keymap.set("i", "<Right>", "->")
keymap.set("i", "<Down>", "￬")
keymap.set("i", "<Left>", "<-")
keymap.set("i", "<S-Up>", "⇑")
keymap.set("i", "<S-Right>", "=>")
keymap.set("i", "<S-Down>", "⇓")
keymap.set("i", "<S-Left>", "<=")
