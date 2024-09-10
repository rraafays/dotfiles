return {
    "robitx/gp.nvim",
    config = function()
        local conf = {}
        local function keymapOptions(desc)
            return {
                noremap = true,
                silent = true,
                nowait = true,
                desc = "GPT prompt " .. desc,
            }
        end
        vim.keymap.set({ "n", "i", "v" }, "<Space>", "<cmd>GpRewrite<cr>", keymapOptions("Inline rewrite"))
        vim.keymap.set({ "n", "i", "v" }, "<Tab>", "<cmd>GpImplement<cr>", keymapOptions("Implement selection"))
        vim.keymap.set({ "n", "i", "v" }, "<C-n>", "<cmd>GpEnew<cr>", keymapOptions("Implement selection"))
        vim.keymap.set({ "n", "i", "v", "x" }, "<C-k>", "<cmd>GpStop<cr>", keymapOptions("Stop"))
        require("gp").setup(conf)
    end,
}
