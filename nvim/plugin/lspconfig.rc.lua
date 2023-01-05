local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

vim.fn.sign_define(
  "DiagnosticSignError",
  { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognise the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- make the server aware of neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
nvim_lsp.omnisharp.setup {
  cmd = { "dotnet", "/home/raf/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" }
}
nvim_lsp.bashls.setup {}
nvim_lsp.jdtls.setup {}
nvim_lsp.gradle_ls.setup {}
nvim_lsp.pylsp.setup {}
