return {
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "vonheikemen/lsp-zero.nvim", branch = "v3.x" },
      "saghen/blink.cmp",
    },
    config = function()
      require("lazy-lsp").setup({
        excluded_servers = {},
        preferred_servers = {
          markdown = {},
          python = { "pyright" },
        },
        default_config = {
          flags = {
            debounce_text_changes = 150,
          },
          -- on_attach = on_attach,
          -- capabilities = capabilities,
        },
        configs = {
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
        },
        prefer_local = true,
      })
    end,
  },
}
