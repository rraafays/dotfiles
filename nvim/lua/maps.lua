local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- lazy command
keymap.set("n", ";", ":")

-- lazy leave
keymap.set("n", "q", ":q<CR>", opts)

-- easy to reach exit
keymap.set("v", "q", "<esc>")

-- force quit
keymap.set("n", "<C-c>", "<Esc>:qa!<CR>", opts)
keymap.set("i", "<C-c>", "<Esc>:qa!<CR>", opts)

-- don't yank on delete
keymap.set("n", "x", '"_x')
keymap.set("n", "d", '"_d')

-- double value under cursor
keymap.set("n", "@", ":s/\\d\\+/\\=submatch(0)*2/<CR>n:nohlsearch<CR>")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- unhighlight search
keymap.set("n", "\\", ":nohlsearch<CR>", opts)

-- quick line del in normal mode
keymap.set("n", "<BS>", "dd")

-- join to line above
keymap.set("n", "K", "kJ")

-- insert arrows
keymap.set("i", "<Up>", "↑")
keymap.set("i", "<Right>", "->")
keymap.set("i", "<Down>", "↓")
keymap.set("i", "<Left>", "<-")
keymap.set("i", "<S-Up>", "⇑")
keymap.set("i", "<S-Right>", "=>")
keymap.set("i", "<S-Down>", "⇓")
keymap.set("i", "<S-Left>", "<=")
