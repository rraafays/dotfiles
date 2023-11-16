local gruvbox = require("gruvbox")

gruvbox.setup({
    italic = {
        strings = false,
        operators = false,
        comments = false,
        folds = false,
    },
    palette_overrides = {
        dark0 = "none",
        dark1 = "none",
        dark2 = "none",
    },
    overrides = {
        Visual = { bg = "none", reverse = true },
    },
})

vim.cmd([[ colorscheme gruvbox ]])
