local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return {
    "nvim-telescope/telescope.nvim",
    config = function()
        map("n", "<C-f>", "<esc><cmd>Telescope find_files<cr>")
        map("i", "<C-f>", "<esc><cmd>Telescope find_files<cr>")
        map("n", "<C-g>", "<esc><cmd>Telescope live_grep<cr>")
        map("i", "<C-g>", "<esc><cmd>Telescope live_grep<cr>")
        map("n", "<C-b>", "<esc><cmd>Telescope buffers<cr>")
        map("i", "<C-b>", "<esc><cmd>Telescope buffers<cr>")
    end,
}
