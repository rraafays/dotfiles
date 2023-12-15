local status, colorizer = pcall(require, "colorizer")
if not status then return end

colorizer.setup({ "*" }, { mode = "foreground" })

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "",
    command = "ColorizerAttachToBuffer",
})
