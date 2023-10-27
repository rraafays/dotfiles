local noice = require("noice")
noice.setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {},
        format = {
            cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "help" },
            input = {},
        },
    },
})
