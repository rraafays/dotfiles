local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-s>", "<esc><cmd>w<cr>")
map("n", "<C-a>", "<esc>gg0VG<cr>")
map("n", "<C-c>", "<esc><cmd>qa!<cr>")
map("n", "q", "<esc><cmd>q<cr>")
map("n", "U", "<C-r>")
map("n", "\\", "<cmd>nohlsearch<cr>")
map("n", "<Tab>", "<cmd>Lspsaga diagnostic_jump_next<cr>")
map("n", "<S-Tab>", "<cmd>Lspsaga diagnostic_jump_prev<cr>")

map("v", "<C-a>", "<esc>gg0VG<cr>")

map("i", "<C-a>", "<esc>gg0VG<cr>")
map("i", "<C-c>", "<esc><cmd>qa!<cr>")

map("i", "<Up>", "↑")
map("i", "<Right>", "->")
map("i", "<Down>", "↓")
map("i", "<Left>", "<-")

map("i", "<S-Up>", "⇑")
map("i", "<S-Right>", "=>")
map("i", "<S-Down>", "⇓")
map("i", "<S-Left>", "<=")
