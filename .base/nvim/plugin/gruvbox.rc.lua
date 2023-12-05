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
        GitSignsChangeLn = { bg = "#252508" },
        -- GitSignsAddLn = { bg = "#8ec07c" },
        GitSignsAddLn = { bg = "#1a2b15" },
        -- GitSignsChangedeleteLn = { bg = "#fb4934" },
        GitSignsChangedeleteLn = { bg = "#3b0701" },
    },
})

vim.cmd([[ colorscheme gruvbox ]])
