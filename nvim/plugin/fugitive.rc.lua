local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set(
    "n",
    "gd",
    "<cmd>NoNeckPainResize 1000<cr><cmd>Gvdiffsplit<cr>",
    opts
)
keymap.set("n", "gb", "<cmd>NoNeckPainResize 1000<cr><cmd>Git blame<cr>", opts)
