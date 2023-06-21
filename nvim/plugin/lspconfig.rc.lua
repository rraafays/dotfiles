local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
    update_in_insert = true;
})

vim.g.rust_recommended_style = true
vim.g.rustfmt_autosave = 1

nvim_lsp.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
nvim_lsp.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
    cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.cssls.setup {}
nvim_lsp.astro.setup {}
nvim_lsp.csharp_ls.setup {}
nvim_lsp.clangd.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.pylsp.setup {}
nvim_lsp.ltex.setup {}
nvim_lsp.taplo.setup {}
nvim_lsp.jdtls.setup {}

vim.fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
    { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
    { texthl = "DiagnosticSignHint", text = "󰌵", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)
