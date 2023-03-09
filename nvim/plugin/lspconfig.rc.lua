local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

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
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognise the 'vim' global
        globals = { 'vim' }
      },
      workspace = {
        -- make the server aware of neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      format = {
        enable = false
      }
    }
  }
}
nvim_lsp.omnisharp.setup {
  cmd = { "dotnet", os.getenv("HOME") .. "/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" }
}
nvim_lsp.clangd.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.jdtls.setup {}
nvim_lsp.gradle_ls.setup {}
nvim_lsp.pylsp.setup {}
nvim_lsp.ltex.setup {}
nvim_lsp.astro.setup {}
nvim_lsp.rust_analyzer.setup {}
