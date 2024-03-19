local configs = require("nvim-treesitter.configs")
local treesitter = require("nvim-treesitter")

configs.setup({
    build = ":TSUpdate",
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    auto_install = true,
})
