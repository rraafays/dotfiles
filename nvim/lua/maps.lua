local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- lazy command
keymap.set("n", ";", ":")

-- escape in place
keymap.set("i", "<del>", "<esc>l")
keymap.set("v", "<del>", "<esc>l")

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

-- write
keymap.set("n", "<C-s>", ":w<CR>")

-- unhighlight search
keymap.set("n", "\\", ":nohlsearch<CR>", opts)

-- quick line del in normal mode
keymap.set("n", "<BS>", "dd")

-- join to line above
keymap.set("n", "K", "kJ")

-- navigate blocks
keymap.set("n", "<Up>", "{")
keymap.set("n", "<Down>", "}")

-- insert arrows
keymap.set("i", "<Up>", "↑")
keymap.set("i", "<Right>", "->")
keymap.set("i", "<Down>", "↓")
keymap.set("i", "<Left>", "<-")
keymap.set("i", "<S-Up>", "⇑")
keymap.set("i", "<S-Right>", "=>")
keymap.set("i", "<S-Down>", "⇓")
keymap.set("i", "<S-Left>", "<=")

-- opt row 1
keymap.set("i", "<A-1>", "¡")
keymap.set("i", "<A-2>", "€")
keymap.set("i", "<A-3>", "£")
keymap.set("i", "<A-4>", "¢")
keymap.set("i", "<A-5>", "∞")
keymap.set("i", "<A-6>", "§")
keymap.set("i", "<A-7>", "¶")
keymap.set("i", "<A-8>", "•")
keymap.set("i", "<A-9>", "ª")
keymap.set("i", "<A-0>", "º")
keymap.set("i", "<A-->", "–")
keymap.set("i", "<A-=>", "≠")
keymap.set("i", "<A-\\>", "«")
keymap.set("i", "<A-`>", "`")
-- opt row 2
keymap.set("i", "<S-A-q>", "œ")
keymap.set("i", "<S-A-w>", "∑")
keymap.set("i", "<S-A-e>", "´")
keymap.set("i", "<S-A-r>", "®")
keymap.set("i", "<S-A-t>", "†")
keymap.set("i", "<S-A-y>", "¥")
keymap.set("i", "<S-A-u>", "¨")
keymap.set("i", "<S-A-i>", "ˆ")
keymap.set("i", "<S-A-o>", "ø")
keymap.set("i", "<S-A-p>", "π")
keymap.set("i", "<S-A-[>", "“")
keymap.set("i", "<S-A-]>", "‘")
-- opt row 3
keymap.set("i", "<S-A-a>", "å")
keymap.set("i", "<S-A-s>", "ß")
keymap.set("i", "<S-A-d>", "∂")
keymap.set("i", "<S-A-f>", "ƒ")
keymap.set("i", "<S-A-g>", "©")
keymap.set("i", "<S-A-h>", "˙")
keymap.set("i", "<S-A-j>", "∆")
keymap.set("i", "<S-A-k>", "˚")
keymap.set("i", "<S-A-l>", "¬")
keymap.set("i", "<S-A-;>", "…")
keymap.set("i", "<S-A-'>", "æ")
-- opt row 4
keymap.set("i", "<S-A-z>", "Ω")
keymap.set("i", "<S-A-x>", "≈")
keymap.set("i", "<S-A-c>", "ç")
keymap.set("i", "<S-A-v>", "√")
keymap.set("i", "<S-A-b>", "∫")
keymap.set("i", "<S-A-n>", "˜")
keymap.set("i", "<S-A-m>", "µ")
keymap.set("i", "<S-A-,>", "≤")
keymap.set("i", "<S-A-.>", "≥")
keymap.set("i", "<S-A-/>", "÷")
