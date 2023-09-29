local chatgpt = require("chatgpt")

chatgpt.setup({})

vim.keymap.set("n", "'", ":ChatGPT<CR>")
