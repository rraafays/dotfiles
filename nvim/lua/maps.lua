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

-- write
keymap.set("n", "<C-s>", ":w<CR>")

-- unhighlight search
keymap.set("n", "\\", ":nohlsearch<CR>", opts)

-- quick line del in normal mode
keymap.set("n", "<BS>", "dd")

-- join to line above
keymap.set("n", "K", "kJ")

-- page up, page down
keymap.set("n", "<Up>", "<C-u>")
keymap.set("n", "<Down>", "<C-d>")

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
keymap.set("i", "<A-q>", "œ")
keymap.set("i", "<A-w>", "∑")
keymap.set("i", "<A-e>", "´")
keymap.set("i", "<A-r>", "®")
keymap.set("i", "<A-t>", "†")
keymap.set("i", "<A-y>", "¥")
keymap.set("i", "<A-u>", "¨")
keymap.set("i", "<A-i>", "ˆ")
keymap.set("i", "<A-o>", "ø")
keymap.set("i", "<A-p>", "π")
keymap.set("i", "<A-[>", "“")
keymap.set("i", "<A-]>", "‘")
-- opt row 3
keymap.set("i", "<A-a>", "å")
keymap.set("i", "<A-s>", "ß")
keymap.set("i", "<A-d>", "∂")
keymap.set("i", "<A-f>", "ƒ")
keymap.set("i", "<A-g>", "©")
keymap.set("i", "<A-h>", "˙")
keymap.set("i", "<A-j>", "∆")
keymap.set("i", "<A-k>", "˚")
keymap.set("i", "<A-l>", "¬")
keymap.set("i", "<A-;>", "…")
keymap.set("i", "<A-'>", "æ")
-- opt row 4
keymap.set("i", "<A-z>", "Ω")
keymap.set("i", "<A-x>", "≈")
keymap.set("i", "<A-c>", "ç")
keymap.set("i", "<A-v>", "√")
keymap.set("i", "<A-b>", "∫")
keymap.set("i", "<A-n>", "˜")
keymap.set("i", "<A-m>", "µ")
keymap.set("i", "<A-,>", "≤")
keymap.set("i", "<A-.>", "≥")
keymap.set("i", "<A-/>", "÷")
