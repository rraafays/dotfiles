local map = vim.keymap.set

map("n", "<f2>", "<cmd>lua vim.diagnostic.goto_next()<cr>")
map("n", "<S-f2>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
