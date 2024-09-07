return {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false,
            })
        end)

        require("lazy-lsp").setup({
            prefer_local = true,
            default_config = {
                flags = {
                    debounce_text_changes = 150,
                },
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
        })
    end,
}
