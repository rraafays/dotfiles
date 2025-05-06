local snacks = require("snacks")

vim.keymap.set("n", "<C-f>", function()
  snacks.picker.git_files()
end, { desc = "Find git files" })
