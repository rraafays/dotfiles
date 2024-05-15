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

lvim.builtin.alpha.dashboard.section.buttons.entries = {}
lvim.builtin.alpha.dashboard.section.footer.val = {}
lvim.builtin.alpha.dashboard.section.header.val = {
    [[                              |`,                           ]],
    [[                               \1\.                         ]],
    [[                              /7606                         ]],
    [[                             ,/7|'6\,                       ]],
    [[                            ,/67  "0\                       ]],
    [[                           ,607' , \6\                      ]],
    [[                          ,600' ;7 :0;               ,      ]],
    [[                         /667   6' |0;             ,;7      ]],
    [[                       ,766"   ;7  ;6/           ,667'      ]],
    [[                     ,677"   ,/7   66'        ,66"67'       ]],
    [[                   ,677"   ,667   606       ,/7' |6/        ]],
    [[                 ,/77"    /70"   /66      ,77'  ,66         ]],
    [[                ,777'   ./67'   .66'    ,76"  , |7/         ]],
    [[               ,677     760'    667    ;77'  /' \66         ]],
    [[ `66,,_        67/     670'     67'   ;76'  :7  |66,        ]],
    [[  `60"606,_    67'    ,67/      66   ,667   \6   \66.       ]],
    [[   `66  "606,_ 66     |70|      67\  667    |6   '606.      ]],
    [[    66    `666,'6     `666      '66\,|67    '6    '606      ]],
    [[    67|  \, '66\6,     \66,       \60066     \;    \606     ]],
    [[    676   6, '66'\.   ,,\6660;,,   `"606\    `6,    '606,   ]],
    [[   ,66    ;\  66,  ,666//^*^*^*\6\,   "67\    66     `606\  ]],
    [[   677    ;7  '66,607'"         `\6\,   \6\   '6,      `60\ ]],
    [[  ,77     ;7   6006"    ,,,;;,,   `66,   66\   \6       \06,]],
    [[ ,67'     ;7   607/    66060606\,  '6|   606   '6\       606]],
    [[ 667      67   667    607     \66   77   606    66\      |06]],
    [[,66      ,7;   667   607   ,  667  ,67   607    |6/       66]],
    [[677      77;   606   607   ';;;'  ,77'  ,607    |6/      ,66]],
    [[677     ,77    606,   606,      ,667'  ,606'    76;      667]],
    [[676     /66,    606    660660066767    606'    /67'     ;67']],
    [[`76,    '66|    `606\,   `"""""'    ,6607'    ,677     667  ]],
    [[ `77,    \66,     `6606,,_     _,,66607"     ,777   ,,67'   ]],
    [[   `666,, `666,     `'"6660000007776"'     ,667' ,.7""      ]],
    [[            `666,,       ```''''         ,/767              ]],
    [[               `6666,,,__        __,,,67777"                ]],
    [[                   `""666666000000777"""'                   ]],
    [[                   `""666666000000777"""'                   ]],
    [[                                                            ]],
    string.format(
        "                          v%s.%s.%s",
        vim.version().major,
        vim.version().minor,
        vim.version().patch
    )
}

lvim.keys.normal_mode["q"] = "<cmd>q<cr>"

lvim.keys.normal_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.insert_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.normal_mode["<C-a>"] = "<esc>gg<S-v>G"
lvim.keys.insert_mode["<C-a>"] = "<esc>gg<S-v>G"
lvim.keys.normal_mode["<C-f>"] = "<esc><cmd>Telescope find_files<cr>"
lvim.keys.insert_mode["<C-f>"] = "<esc><cmd>Telescope find_files<cr>"
lvim.keys.normal_mode["<C-g>"] = "<esc><cmd>Telescope live_grep<cr>"
lvim.keys.insert_mode["<C-g>"] = "<esc><cmd>Telescope live_grep<cr>"

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

lvim.keys.normal_mode["<Tab>"] = "<cmd>Lspsaga diagnostic_jump_next<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>Lspsaga diagnostic_jump_prev<cr>"
lvim.plugins = {
    { "chaoren/vim-wordmotion", },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                server_filetype_map = {},
                symbol_in_winbar = {
                    enable = false,
                },
                beacon = {
                    enable = false,
                },
                code_action = {
                    show_server_name = true,
                },
                lightbulb = {
                    enable = false,
                    enable_in_insert = false,
                    sign = false,
                },
                ui = {
                    border = "rounded",
                    colors = {
                        normal_bg = "#282828",
                        title_bg = "#EBDBB2",
                        red = "#fb4833",
                        green = "#b8ba25",
                        yellow = "#fabc2e",
                        blue = "#83a597",
                        magenta = "#d3859a",
                        cyan = "#8ec07b",
                        white = "#ebdbb2",
                        black = "#282828",
                    },
                    actionfix = "󰌵 ",
                },
            })
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
