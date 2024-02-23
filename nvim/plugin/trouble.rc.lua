local trouble = require("trouble")
trouble.setup({})

vim.keymap.set("n", "<Space>", ":NoNeckPainResize 1000<CR>:TroubleToggle<CR>")
