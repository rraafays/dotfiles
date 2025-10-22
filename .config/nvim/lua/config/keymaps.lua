local map = vim.keymap.set

map("n", "<F2>", "<cmd>lua vim.diagnostic.goto_next()<cr>")
map("n", "<S-F2>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

map("n", "<M-1>", Snacks.picker.explorer)

map("n", "<M-F12>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end)
map("t", "<M-F12>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end)
map("n", "<C-f>", function()
  Snacks.picker.files()
end)
