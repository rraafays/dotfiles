local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({})
mason_lsp.setup({
    ensure_installed = {
        "jdtls",
        "astro",
        "bashls",
        "clangd",
        "csharp_ls",
        "cssls",
        "elmls",
        "html",
        "lemminx",
        "ltex",
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "tsserver",
    },
})
