vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.wo.number = false
vim.opt.signcolumn = "no"
vim.opt.relativenumber = false
vim.opt.showtabline = 0
vim.opt.cmdheight = 0
vim.opt.fillchars = {
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
    eob = " ",
    fold = " ",
    foldsep = " ",
    foldopen = "+",
    foldclose = "-",
}
vim.o.guicursor = table.concat({
    "n-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}, ",")


lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
lvim.use_icons = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.breadcrumbs.active = false
lvim.colorscheme = "gruvbox"
lvim.builtin.bufferline.active = false
lvim.builtin.indentlines.active = false
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

lvim.builtin.gitsigns.opts = {
    signcolumn = false,
    linehl = true,
}
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
    { "chaoren/vim-wordmotion", },
    {
        "ellisonleao/gruvbox.nvim",
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
    {
        "shortcuts/no-neck-pain.nvim",
        config = function()
            DOCUMENT_WIDTH = 80
            RECEIPT_WIDTH = 60

            require("no-neck-pain").setup({
                debug = false,
                width = DOCUMENT_WIDTH,
                minSideBufferWidth = 0,
                disableOnLastBuffer = true,
                killAllBuffersOnDisable = true,
                autocmds = {
                    enableOnVimEnter = true,
                    enableOnTabEnter = true,
                    reloadOnColorSchemeChange = true,
                },
                mappings = {
                    enabled = true,
                    widthUp = "=",
                    widthDown = "-",
                    scratchPad = "false",
                },
            })

            vim.api.nvim_create_user_command("Center", function()
                local filetype = vim.bo.filetype
                if filetype == "xxd" or filetype == "alpha" then
                    vim.cmd("NoNeckPainResize " .. DOCUMENT_WIDTH)
                    return
                elseif filetype == "text" then
                    vim.cmd("NoNeckPainResize " .. RECEIPT_WIDTH)
                    return
                end
                local path = vim.fn.expand("%:p")
                local command = io.popen("wc -L " .. path:gsub(" ", "\\ "))
                if command ~= nil then
                    local result = command:read("*a")
                    for i in string.gmatch(result, "%S+") do
                        if tonumber(i) ~= nil then vim.cmd("NoNeckPainResize " .. i + 2) end
                    end
                end
            end, {})

            vim.api.nvim_create_user_command("Square", function()
                local command = io.popen("tput lines")
                if command ~= nil then
                    local result = command:read("*a")
                    vim.cmd("NoNeckPainResize " .. result * 2)
                end
            end, {})

            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = "",
                command = "Center",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "man",
                command = "Square",
            })
        end
    }
}
