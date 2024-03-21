local chatgpt = require("chatgpt")
chatgpt.setup({})

vim.keymap.set("n", "<a-g>", "<cmd>ChatGPT<CR>")
vim.keymap.set("n", "<a-c>", "<cmd>ChatGPTCompleteCode<CR>")
vim.keymap.set("n", "<a-e>", "<cmd>ChatGPTEditWithInstructions<CR>")
vim.keymap.set("n", "<a-r>", ":ChatGPTRun ")
