return {
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
}
