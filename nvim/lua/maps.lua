local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local function O(key, result)
    keymap.set("i", string.format("<A-%s>", key), result)
end
local function C(key)
    keymap.set("i", string.format("<C-%s>", key), string.format("<esc>%s", key))
end

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

-- stylua: ignore start
--   1            2            3            4  
O("1", "¡")  O("q", "œ")  O("a", "å")  O("z", "Ω")
O("2", "€")  O("w", "∑")  O("s", "ß")  O("x", "≈")
O("3", "£")  O("e", "´")  O("d", "∂")  O("c", "ç")
O("4", "¢")  O("r", "®")  O("f", "ƒ")  O("v", "√")
O("5", "∞")  O("t", "†")  O("g", "©")  O("b", "∫")
O("6", "§")  O("y", "¥")  O("h", "˙")  O("n", "˜")
O("7", "¶")  O("u", "¨")  O("j", "∆")  O("m", "µ")
O("8", "•")  O("i", "ˆ")  O("k", "˚")  O(",", "≤")
O("9", "ª")  O("o", "ø")  O("l", "¬")  O(".", "≥")
O("0", "º")  O("p", "π")  O(";", "…")  O("/", "÷")
O("-", "–")  O("[", "“")  O("'", "æ")
O("=", "≠")  O("]", "‘")
O("\\", "«")
O("`", "`")

-- 1       2       3       4
C("1")  C("q")  C("a")  C("z")
C("2")  C("w")  C("s")  C("x")
C("3")  C("e")  C("d")  C("c")
C("4")  C("r")  C("f")  C("v")
C("5")  C("t")  C("g")  C("b")
C("6")  C("y")  C("h")  C("n")
C("7")  C("u")  C("j")  C("m")
C("8")  C("i")  C("k")  C(",")
C("9")  C("o")  C("l")  C(".")
C("0")  C("p")  C(";")  C("/")
C("-")  C("[")  C("'")
C("=")  C("]")
C("\\")
C("`")
-- stylua: ignore end
