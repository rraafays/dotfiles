return {
    "uZer/pywal16.nvim",
    lazy = false,
    config = function()
        local pywal16 = require("pywal16")
        pywal16.setup()
        vim.cmd([[colorscheme pywal16]])
    end,
}
