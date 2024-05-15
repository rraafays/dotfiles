vim.wo.number = false
vim.opt.virtualedit = "block"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "no"
vim.opt.relativenumber = false
vim.opt.showtabline = 0
vim.opt.cmdheight = 0
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true
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

lvim.colorscheme = "gruvbox"

lvim.builtin.breadcrumbs.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }
lvim.builtin.gitsigns.opts = {
    signcolumn = false,
    linehl = true,
}
lvim.builtin.lualine.sections = {
    lualine_a = {
        "mode",
    },
    lualine_b = {
        "branch",
    },
    lualine_c = {
        {
            "filename",
            file_status = true,
            path = 1,
        },
    },
    lualine_x = {
        {
            "diagnostics",
            sources = {
                "nvim_diagnostic",
            },
            symbols = {
                error = "ERROR ",
                warn = "WARN ",
                info = "INFO ",
                hint = "NOTE ",
            },
        },
        "encoding",
        "filetype",
    },
    lualine_y = {
        "progress",
    },
    lualine_z = {
        "location",
    },
}

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

lvim.keys.normal_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.insert_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.normal_mode["<C-a>"] = "<esc>gg<S-v>G"
lvim.keys.insert_mode["<C-a>"] = "<esc>gg<S-v>G"
lvim.keys.normal_mode["\\"] = "<cmd>nohlsearch<cr>"

lvim.keys.insert_mode["<Up>"] = "↑"
lvim.keys.insert_mode["<Right>"] = "->"
lvim.keys.insert_mode["<Down>"] = "↓"
lvim.keys.insert_mode["<Left>"] = "<-"
lvim.keys.insert_mode["<S-Up>"] = "⇑"
lvim.keys.insert_mode["<S-Right>"] = "=>"
lvim.keys.insert_mode["<S-Down>"] = "⇓"
lvim.keys.insert_mode["<S-Left>"] = "<="

lvim.keys.insert_mode["<A-1>"] = "¡"
lvim.keys.insert_mode["<A-q>"] = "œ"
lvim.keys.insert_mode["<A-a>"] = "å"
lvim.keys.insert_mode["<A-z>"] = "Ω"
lvim.keys.insert_mode["<A-2>"] = "€"
lvim.keys.insert_mode["<A-w>"] = "∑"
lvim.keys.insert_mode["<A-s>"] = "ß"
lvim.keys.insert_mode["<A-x>"] = "≈"
lvim.keys.insert_mode["<A-3>"] = "£"
lvim.keys.insert_mode["<A-e>"] = "´"
lvim.keys.insert_mode["<A-d>"] = "∂"
lvim.keys.insert_mode["<A-c>"] = "ç"
lvim.keys.insert_mode["<A-4>"] = "¢"
lvim.keys.insert_mode["<A-r>"] = "®"
lvim.keys.insert_mode["<A-f>"] = "ƒ"
lvim.keys.insert_mode["<A-v>"] = "√"
lvim.keys.insert_mode["<A-5>"] = "∞"
lvim.keys.insert_mode["<A-t>"] = "†"
lvim.keys.insert_mode["<A-g>"] = "©"
lvim.keys.insert_mode["<A-b>"] = "∫"
lvim.keys.insert_mode["<A-6>"] = "§"
lvim.keys.insert_mode["<A-y>"] = "¥"
lvim.keys.insert_mode["<A-h>"] = "˙"
lvim.keys.insert_mode["<A-n>"] = "˜"
lvim.keys.insert_mode["<A-7>"] = "¶"
lvim.keys.insert_mode["<A-u>"] = "¨"
lvim.keys.insert_mode["<A-j>"] = "∆"
lvim.keys.insert_mode["<A-m>"] = "µ"
lvim.keys.insert_mode["<A-8>"] = "•"
lvim.keys.insert_mode["<A-i>"] = "ˆ"
lvim.keys.insert_mode["<A-k>"] = "˚"
lvim.keys.insert_mode["<A-,>"] = "≤"
lvim.keys.insert_mode["<A-9>"] = "ª"
lvim.keys.insert_mode["<A-o>"] = "ø"
lvim.keys.insert_mode["<A-l>"] = "¬"
lvim.keys.insert_mode["<A-.>"] = "≥"
lvim.keys.insert_mode["<A-0>"] = "º"
lvim.keys.insert_mode["<A-p>"] = "π"
lvim.keys.insert_mode["<A-;>"] = "…"
lvim.keys.insert_mode["<A-/>"] = "÷"
lvim.keys.insert_mode["<A-->"] = "–"
lvim.keys.insert_mode["<A-[>"] = "“"
lvim.keys.insert_mode["<A-'>"] = "æ"
lvim.keys.insert_mode["<A-=>"] = "≠"
lvim.keys.insert_mode["<A-]>"] = "‘"
lvim.keys.insert_mode["<A-\\>"] = "«"
lvim.keys.insert_mode["<A-`>"] = "`"

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
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    },
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
                disableOnLastBuffer = false,
                killAllBuffersOnDisable = false,
                autocmds = {
                    enableOnVimEnter = true,
                    enableOnTabEnter = false,
                    reloadOnColorSchemeChange = false,
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
                if filetype == "TelescopePrompt" or filetype == "alpha" or filetype == "lazy" then
                    return
                end
                vim.cmd("w! ~/.cache/lvim/width")
                local command = io.popen("wc -L " .. "~/.cache/lvim/width")
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

            vim.api.nvim_create_autocmd("CursorMovedI", {
                pattern = "",
                command = "Center",
            })

            vim.api.nvim_create_autocmd("TextChanged", {
                pattern = "",
                command = "Center",
            })

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
