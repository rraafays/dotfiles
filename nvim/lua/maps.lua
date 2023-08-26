-- shortens vim.keymap to just keymap by redifining it in lua
local keymap = vim.keymap

-- lazy command
keymap.set("n", ";", ":")

-- lazy leave
keymap.set("n", "q", ":q<CR>")

-- easy to reach exit
keymap.set("v", "q", "<esc>")

-- force quit
keymap.set("n", "<C-c>", "<Esc>:qa!<CR>")
keymap.set("i", "<C-c>", "<Esc>:qa!<CR>")

-- don't yank on delete
keymap.set("n", "x", '"_x')
keymap.set("n", "d", '"_d')

-- increment or decrement value under cursor
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "+", "10<C-a>")
keymap.set("n", "_", "10<C-x>")

-- double value under cursor
keymap.set("n", "@", ":s/\\d\\+/\\=submatch(0)*2/<CR>n:nohlsearch<CR>")

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

-- pane nav
keymap.set("n", "<A-k>", ":wincmd k<CR>")
keymap.set("n", "<A-l>", ":wincmd l<CR>")
keymap.set("n", "<A-j>", ":wincmd j<CR>")
keymap.set("n", "<A-h>", ":wincmd h<CR>")
keymap.set("t", "<A-k>", "<cmd> wincmd k<CR>")
keymap.set("t", "<A-l>", "<cmd> wincmd l<CR>")
keymap.set("t", "<A-j>", "<cmd> wincmd j<CR>")
keymap.set("t", "<A-h>", "<cmd> wincmd h<CR>")

-- insert arrows
keymap.set("i", "<Up>", "￪")
keymap.set("i", "<Right>", "->")
keymap.set("i", "<Down>", "￬")
keymap.set("i", "<Left>", "<-")
keymap.set("i", "<S-Up>", "⇑")
keymap.set("i", "<S-Right>", "=>")
keymap.set("i", "<S-Down>", "⇓")
keymap.set("i", "<S-Left>", "<=")
