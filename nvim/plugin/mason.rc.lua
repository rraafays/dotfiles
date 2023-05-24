local status, mason = pcall(require, 'mason')
if (not status) then return end

local status, mason_lsp = pcall(require, 'mason-lspconfig')
if (not status) then return end

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
        'pylsp'
    }
}
