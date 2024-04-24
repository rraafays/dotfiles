local chatgpt = require("chatgpt")
chatgpt.setup({})

vim.keymap.set("n", "<a-g>", "<cmd>ChatGPT<cr>")
vim.keymap.set("v", "!", "<cmd>ChatGPTRun summarize<cr>")
vim.keymap.set("v", "@", "<cmd>ChatGPTRun docstring<cr>")
vim.keymap.set("v", "-", "<cmd>ChatGPTRun optimize_code<cr>")
vim.keymap.set("v", "+", "<cmd>ChatGPTRun add_tests<cr>")
