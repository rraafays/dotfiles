local hop = require("hop")
local keymap = vim.keymap
local opts = { remap = true, silent = true }

hop.setup({
    jump_on_sole_occurrence = false,
    keys = "asdfghjkl",
    create_hl_autocmd = false,
    uppercase_labels = true,
})

vim.api.nvim_set_hl(0, "HopNextKey", { bg = "#2b1e01", fg = "#FABC2E" })
vim.api.nvim_set_hl(0, "HopNextKey1", { bg = "#2b1e01", fg = "#FABC2E" })
vim.api.nvim_set_hl(0, "HopNextKey2", { bg = "#2b1e01", fg = "#FABC2E" })
vim.api.nvim_set_hl(0, "HopUnmatched", { nil })
vim.api.nvim_set_hl(0, "HopCursor", { bg = "#2b1e01", fg = "#FABC2E" })

keymap.set("n", "<space>", ":HopWord<CR>", opts)
keymap.set(
    "",
    "f",
    function()
        hop.hint_char1({
            current_line_only = true,
        })
    end,
    opts
)
keymap.set(
    "",
    "t",
    function()
        hop.hint_char1({
            current_line_only = true,
            hint_offset = -1,
        })
    end,
    opts
)
keymap.set(
    "",
    "T",
    function()
        hop.hint_char1({
            current_line_only = true,
            hint_offset = 1,
        })
    end,
    opts
)
