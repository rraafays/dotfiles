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

-- Autocmd commands
-- -- Persistent Folds
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*.*",
    callback = function()
        vim.cmd.mkview()
    end,
    group = save_fold,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.*",
    callback = function()
        vim.cmd.loadview({ mods = { emsg_silent = true } })
    end,
    group = save_fold,
})
-- Persistent Cursor
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Cursor Line on each window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
        if ok and cl then
            vim.wo.cursorline = true
            vim.api.nvim_win_del_var(0, "auto-cursorline")
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    callback = function()
        local cl = vim.wo.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
            vim.wo.cursorline = false
        end
    end,
})

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
lvim.builtin.treesitter.ensure_installed = "all"
require("nvim-treesitter.install").compilers = { "gcc" }
lvim.builtin.gitsigns.opts = {
    signcolumn = false,
    linehl = true,
    on_attach = function()
        if vim.bo.filetype:match("markdown") then
            return false
        end
    end,
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
        c = { fg = "#A89983", bg = "none" },
    },
    insert = {
        a = { fg = "#448488", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" },
    },

    replace = {
        a = { fg = "#FB4833", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" },
    },

    visual = {
        a = { fg = "#FE8019", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" },
    },

    command = {
        a = { fg = "#B8BA25", bg = "none" },
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" },
    },

    inactive = {
        b = { fg = "#EBDBB2", bg = "none" },
        c = { fg = "#A89983", bg = "none" },
    },
}

lvim.builtin.alpha.dashboard.section.buttons.entries = {}
table.insert(lvim.builtin.alpha.dashboard.section.buttons.entries, { "f", "find", "<cmd>Telescope find_files<cr>" })
table.insert(lvim.builtin.alpha.dashboard.section.buttons.entries, { "g", "grep", "<cmd>Telescope live_grep<cr>" })
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
    string.format("                          v%s.%s.%s", vim.version().major, vim.version().minor, vim.version().patch),
}

lvim.keys.normal_mode["q"] = "<cmd>q<cr>"
lvim.keys.normal_mode["U"] = "<C-r>"

lvim.keys.normal_mode["<C-a>"] = "<esc>ggvG<cr>"
lvim.keys.insert_mode["<C-a>"] = "<esc>ggvG<cr>"
lvim.keys.visual_mode["<C-a>"] = "<esc>ggvG<cr>"
lvim.keys.normal_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.insert_mode["<C-c>"] = "<esc><cmd>qa!<cr>"
lvim.keys.normal_mode["<C-f>"] = "<esc><cmd>Telescope find_files<cr>"
lvim.keys.insert_mode["<C-f>"] = "<esc><cmd>Telescope find_files<cr>"
lvim.keys.normal_mode["<C-g>"] = "<esc><cmd>Telescope live_grep<cr>"
lvim.keys.insert_mode["<C-g>"] = "<esc><cmd>Telescope live_grep<cr>"
lvim.keys.normal_mode["<C-b>"] = "<esc><cmd>Telescope buffers<cr>"
lvim.keys.insert_mode["<C-b>"] = "<esc><cmd>Telescope buffers<cr>"

lvim.keys.normal_mode["\\"] = "<cmd>nohlsearch<cr>"
lvim.keys.insert_mode["<Up>"] = "↑"
lvim.keys.insert_mode["<Right>"] = "->"
lvim.keys.insert_mode["<Down>"] = "↓"
lvim.keys.insert_mode["<Left>"] = "<-"
lvim.keys.insert_mode["<S-Up>"] = "⇑"
lvim.keys.insert_mode["<S-Right>"] = "=>"
lvim.keys.insert_mode["<S-Down>"] = "⇓"
lvim.keys.insert_mode["<S-Left>"] = "<="

lvim.keys.normal_mode["<Tab>"] = "<cmd>Lspsaga diagnostic_jump_next<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>Lspsaga diagnostic_jump_prev<cr>"

lvim.keys.normal_mode["<A-g>"] = "<cmd>ChatGPT<cr>"
lvim.keys.visual_mode["!"] = "<cmd>ChatGPTEditWithInstructions<cr>"
lvim.keys.visual_mode["?"] = "<cmd>ChatGPTRun explain_code<cr>"

lvim.plugins = {
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("chatgpt").setup()
        end,
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("render-markdown").setup({
                start_enabled = true,
                max_file_size = 1.5,
                markdown_query = [[
        (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
        ] @heading)

        (thematic_break) @dash

        (fenced_code_block) @code

        [
            (list_marker_plus)
            (list_marker_minus)
            (list_marker_star)
        ] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote (block_quote_marker) @quote_marker)
        (block_quote (paragraph (inline (block_continuation) @quote_marker)))

        (pipe_table) @table
        (pipe_table_header) @table_head
        (pipe_table_delimiter_row) @table_delim
        (pipe_table_row) @table_row
    ]],
                inline_query = [[
        (code_span) @code

        (shortcut_link) @callout
    ]],
                log_level = "error",
                file_types = { "markdown" },
                render_modes = { "n", "c" },
                headings = { "", "", "", "", "", "" },
                dash = "—",
                bullets = { "●", "○", "◆", "◇" },
                checkbox = {
                    unchecked = "󰄱 ",
                    checked = " ",
                },
                quote = "┃",
                callout = {
                    note = "  Note",
                    tip = "  Tip",
                    important = "󰅾  Important",
                    warning = "  Warning",
                    caution = "󰳦  Caution",
                },
                conceal = {
                    default = vim.opt.conceallevel:get(),
                    rendered = 3,
                },
                table_style = "full",
                highlights = {
                    heading = {
                        backgrounds = { "Keyword", "Keyword", "Comment" },
                        foregrounds = {
                            "markdownH1",
                            "markdownH2",
                            "markdownH3",
                            "markdownH4",
                            "markdownH5",
                            "markdownH6",
                        },
                    },
                    dash = "LineNr",
                    code = "",
                    bullet = "Comment",
                    checkbox = {
                        unchecked = "@markup.list.unchecked",
                        checked = "@markup.heading",
                    },
                    table = {
                        head = "@markup.heading",
                        row = "Normal",
                    },
                    latex = "@markup.math",
                    quote = "@markup.quote",
                    callout = {
                        note = "DiagnosticInfo",
                        tip = "DiagnosticOk",
                        important = "DiagnosticHint",
                        warning = "DiagnosticWarn",
                        caution = "DiagnosticError",
                    },
                },
            })
        end,
    },
    { "chaoren/vim-wordmotion" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
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
        end,
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
        end,
    },
    {
        "shortcuts/no-neck-pain.nvim",
        config = function()
            DOCUMENT_WIDTH = 60
            RECEIPT_WIDTH = 40

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
                if
                    filetype == "TelescopePrompt"
                    or filetype == "alpha"
                    or filetype == "lazy"
                    or filetype == "chatgpt-input"
                then
                    return
                end
                vim.cmd("w! ~/.cache/lvim/width")
                local command = io.popen("wc -L " .. "~/.cache/lvim/width")
                if command ~= nil then
                    local result = command:read("*a")
                    for i in string.gmatch(result, "%S+") do
                        if tonumber(i) ~= nil then
                            vim.cmd("NoNeckPainResize " .. i + 2)
                        end
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
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            local conform = require("conform")

            local function get_os()
                return vim.loop.os_uname().sysname
            end
            local formatter_config_dir = os.getenv("HOME") .. "/.config/lvim/etc/"

            local function get_idea_bin()
                if get_os() == "Darwin" then
                    return "idea"
                end
                if get_os() == "Linux" then
                    return "idea-community"
                end
            end

            local slow_format_filetypes = { "java" }
            local function get_formatters()
                if os.getenv("FORMAT") ~= "no" then
                    return {
                        lua = { "stylua" },
                        sh = { "shfmt" },
                        fish = { "fish_indent" },
                        javascript = { "prettier" },
                        typescript = { "cognitran" },
                        typescriptreact = { "cognitran" },
                        xml = { "xmlformat" },
                        sql = { "redgate" },
                        java = { "intellij" },
                        json = { "prettier" },
                        html = { "prettier" },
                        nix = { "nixpkgs_fmt" },
                        rust = { "rustfmt" },
                    }
                else
                    return {}
                end
            end

            conform.setup({
                formatters_by_ft = get_formatters(),
                formatters = {
                    intellij = {
                        command = get_idea_bin(),
                        require_cwd = false,
                        stdin = false,
                        args = {
                            "format",
                            "-s",
                            formatter_config_dir .. "intellij.xml",
                            "$FILENAME",
                        },
                    },
                    redgate = {
                        command = "sql-formatter",
                        stdin = true,
                        args = {
                            "--config",
                            formatter_config_dir .. "redgate.json",
                        },
                    },
                    prettier = {
                        command = "prettier",
                        stdin = true,
                        args = { "--tab-width", 4, "--stdin-filepath", "$FILENAME" },
                    },
                    xmlformat = {
                        command = "xmlformat",
                        stdin = true,
                        args = { "$FILENAME" },
                    },
                    nixpkgs_fmt = {
                        command = "nixpkgs-fmt",
                        stdin = false,
                        args = { "$FILENAME" },
                    },
                    cognitran = {
                        command = "prettier",
                        stdin = true,
                        args = {
                            "--trailing-comma",
                            "es5",
                            "--tab-width",
                            2,
                            "--print-width",
                            100,
                            "--prose-wrap",
                            "always",
                            "--stdin-filepath",
                            "$FILENAME",
                        },
                    },
                    rustfmt = {
                        command = "rustfmt",
                        args = {
                            "--config",
                            "fn_single_line=true,where_single_line=true,tab_spaces=4,imports_layout=Vertical,hex_literal_case=Upper,max_width=80",
                        },
                    },
                },

                format_on_save = function(bufnr)
                    if slow_format_filetypes[vim.bo[bufnr].filetype] then
                        return
                    end
                    local function on_format(err)
                        if err and err:match("timeout$") then
                            slow_format_filetypes[vim.bo[bufnr].filetype] = true
                        end
                    end

                    return { timeout_ms = 1000, lsp_fallback = false }, on_format
                end,

                format_after_save = function(bufnr)
                    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                        return
                    end
                    return { lsp_fallback = false }
                end,
            })
        end,
    },
}
