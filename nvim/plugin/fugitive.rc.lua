local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "gd", ":NoNeckPainResize 1000<CR>:Gvdiffsplit<CR>", opts)
keymap.set("n", "gb", ":NoNeckPainResize 1000<CR>:Git blame<CR>", opts)
