local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup { }
mason_lsp.setup {
    ensure_installed = {
        'rust_analyzer',
        'bashls',
        'clangd',
        'csharp_ls',
        'ltex',
        'lua_ls',
        'tsserver',
        'taplo',
        'pylsp',
        'astro',
        'cssls'
    }
}
