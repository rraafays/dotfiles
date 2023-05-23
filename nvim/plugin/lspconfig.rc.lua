local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

vim.g.rust_recommended_style = true
nvim_lsp.rust_analyzer.setup {
  settings = {
    [ "rust-analyzer" ] = {
      diagnostics = { disabled = { "unresolved-proc-macro" } }
    }
  }
}
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
nvim_lsp.csharp_ls.setup {}
nvim_lsp.clangd.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.pylsp.setup {}
nvim_lsp.ltex.setup {}
nvim_lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

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
  { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)
