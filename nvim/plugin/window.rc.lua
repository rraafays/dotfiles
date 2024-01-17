local window = require("nvim-window")
window.setup({
    chars = {
        "a",
        "s",
        "d",
        "f",
        "g",
        "h",
        "j",
        "k",
        "l",
    },

    normal_hl = "Normal",
    hint_hl = "Bold",
    border = "single",
})

vim.keymap.set("n", "m", "<cmd>lua require('nvim-window').pick()<CR>")
