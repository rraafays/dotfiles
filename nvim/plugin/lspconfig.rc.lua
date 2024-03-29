local nvim_lsp = require("lspconfig")

local function get_os() return vim.loop.os_uname().sysname end
local function disable_check_third_party()
    if get_os() == "Darwin" then return "Disable" end
    if get_os() == "Linux" then return false end
end

nvim_lsp.cssls.setup({})
nvim_lsp.astro.setup({})
nvim_lsp.csharp_ls.setup({})
nvim_lsp.clangd.setup({})
nvim_lsp.bashls.setup({})
nvim_lsp.pylsp.setup({})
nvim_lsp.ltex.setup({})
nvim_lsp.taplo.setup({})
nvim_lsp.sqlls.setup({})
nvim_lsp.nil_ls.setup({})
nvim_lsp.lemminx.setup({
    settings = {
        xml = {
            validation = {
                resolveExternalEntities = true,
            },
        },
    },
})
nvim_lsp.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = disable_check_third_party(),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
nvim_lsp.tsserver.setup({
    filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
    },
    cmd = { "typescript-language-server", "--stdio" },
})

vim.diagnostic.config({
    update_in_insert = true,
})

vim.fn.sign_define("DiagnosticSignWarn", {
    texthl = "DiagnosticSignWarn",
    text = "",
    numhl = "DiagnosticSignWarn",
})
vim.fn.sign_define("DiagnosticSignHint", {
    texthl = "DiagnosticSignHint",
    text = "󰌵",
    numhl = "DiagnosticSignHint",
})
vim.fn.sign_define("DiagnosticSignInfo", {
    texthl = "DiagnosticSignInfo",
    text = "",
    numhl = "DiagnosticSignInfo",
})
vim.fn.sign_define("DiagnosticSignError", {
    texthl = "DiagnosticSignError",
    text = "",
    numhl = "DiagnosticSignError",
})
