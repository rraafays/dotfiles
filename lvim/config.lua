vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false

lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
lvim.use_icons = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "gruvbox"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.lualine.options.theme = {
    normal = {
        a = { fg = "#A89983", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    },
    insert = {
        a = { fg = "#448488", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    },

    replace = {
        a = { fg = "#FB4833", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    },

    visual = {
        a = { fg = "#FE8019", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    },

    command = {
        a = { fg = "#B8BA25", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    },

    inactive = {
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" }
    }
}


lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

lvim.plugins = {
    {
        "ellisonleao/gruvbox.nvim", -- gruvbox theme
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    operators = false,
                    comments = false,
                    folds = false,
                },
                palette_overrides = {
                    dark0 = "none",
                    dark1 = "none",
                    dark2 = "none",
                },
                overrides = {
                    Visual = { bg = "#2a1300", fg = "#FE8019" },
                    GitSignsChangeLn = { bg = "#1c1c06" },
                    GitSignsAddLn = { bg = "#14200f" },
                    GitSignsChangedeleteLn = { bg = "#2d0501" },
                    IncSearch = { bg = "#2b1e01", fg = "#FABC2E", reverse = false },
                    CurSearch = { bg = "#2b1e01", fg = "#FABC2E", reverse = true },
                    Search = { bg = "#2b1e01", fg = "#FABC2E", reverse = false },
                    NotifyBackground = { bg = "#000000" },
                    NoiceCmdlineIcon = { fg = "#EBDBB2" },
                    NoiceCmdlineIconCalculator = { fg = "#EBDBB2" },
                    NoiceCmdlineIconCmdline = { fg = "#EBDBB2" },
                    NoiceCmdlineIconFilter = { fg = "#EBDBB2" },
                    NoiceCmdlineIconHelp = { fg = "#EBDBB2" },
                    NoiceCmdlineIconIncRename = { fg = "#EBDBB2" },
                    NoiceCmdlineIconInput = { fg = "#EBDBB2" },
                    NoiceCmdlineIconLua = { fg = "#EBDBB2" },
                    NoiceCmdlineIconSearch = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorder = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderCalculator = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderCmdline = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderFilter = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderHelp = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderIncRename = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderInput = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderLua = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupBorderSearch = { fg = "#EBDBB2" },
                    NoiceCmdlinePopupTitle = { fg = "#EBDBB2" },
                },
            })
        end
    },
}