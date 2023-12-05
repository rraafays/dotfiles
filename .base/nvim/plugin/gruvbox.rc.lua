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
        Visual = { bg = "#2a1300", fg = "#FE8019" },
        GitSignsChangeLn = { bg = "#1c1c06" },
        GitSignsAddLn = { bg = "#14200f" },
        GitSignsChangedeleteLn = { bg = "#2d0501" },
    },
})

vim.cmd([[ colorscheme gruvbox ]])
