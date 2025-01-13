return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine = require("lualine")

        local theme = require("lualine.themes.16color")
        local function search_term()
            local res = vim.fn.searchcount()
            if res.total > 0 then
                return string.format("/ %s/%d", res.current, res.total)
            else
                return ""
            end
        end

        theme.normal.a = { fg = 15, bg = "none" }
        theme.normal.b = { fg = 5, bg = "none" }
        theme.normal.c = { fg = 0, bg = "none" }

        theme.visual.a = { fg = 3, bg = "none" }
        theme.visual.b = { fg = 5, bg = "none" }
        theme.visual.c = { fg = 0, bg = "none" }

        theme.insert.a = { fg = 2, bg = "none" }
        theme.insert.b = { fg = 5, bg = "none" }
        theme.insert.c = { fg = 0, bg = "none" }

        theme.replace.a = { fg = 1, bg = "none" }
        theme.replace.b = { fg = 5, bg = "none" }
        theme.replace.c = { fg = 0, bg = "none" }

        lualine.setup({
            options = {
                theme = theme,
                globalstatus = true,
                icons_enabled = true,
                component_separators = {
                    left = "",
                    right = "",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
                disabled_filetypes = {},
            },
            sections = {
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
                        search_term,
                    },
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
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_x = {
                    "location",
                },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
        })
    end,
}
