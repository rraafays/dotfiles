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

        theme = {
            normal = {
                a = { fg = 7, bg = "none" },
                b = { fg = 5, bg = "none" },
                c = { fg = 0, bg = "none" },
            },
            visual = {
                a = { fg = 11, bg = "none" },
                b = { fg = 5, bg = "none" },
                c = { fg = 0, bg = "none" },
            },
            insert = {
                a = { fg = 4, bg = "none" },
                b = { fg = 5, bg = "none" },
                c = { fg = 0, bg = "none" },
            },
            replace = {
                a = { fg = 9, bg = "none" },
                b = { fg = 5, bg = "none" },
                c = { fg = 0, bg = "none" },
            },
        }

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
