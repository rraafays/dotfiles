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
        -- GitSignsChangeLn = { bg = "#b8bb26" },
        GitSignsChangeLn = { bg = "#1c1c06" },
        -- GitSignsAddLn = { bg = "#8ec07c" },
        GitSignsAddLn = { bg = "#14200f" },
        -- GitSignsChangedeleteLn = { bg = "#fb4934" },
        GitSignsChangedeleteLn = { bg = "#2d0501" },
    },
})

vim.cmd([[ colorscheme gruvbox ]])
