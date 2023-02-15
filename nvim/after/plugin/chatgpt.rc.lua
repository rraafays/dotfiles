local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

vim.keymap.set('n', '<A-g>', ':ChatGPT<CR>')
vim.keymap.set('n', '<A-a>', ':ChatGPTActAs<CR>')
vim.keymap.set('n', '<A-c>', ':ChatGPTCompleteCode<CR>')

chatgpt.setup()
