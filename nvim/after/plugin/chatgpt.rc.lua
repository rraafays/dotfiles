local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

vim.keymap.set('n', '<A-g>', ':ChatGPT<CR>')
vim.keymap.set('n', '<A-i>', ':ChatGPTEditWithInstructions<CR>')

chatgpt.setup({
  keymaps = {
    yank_last = "<A-y>"
  }
})
