local keys = require("keys")

keys.setup {
    win_opts = {
        width = 10
    },
}

vim.cmd([[ KeysToggle ]])
