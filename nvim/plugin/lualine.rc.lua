local lualine = require("lualine")
local theme = require('lualine.themes.gruvbox')

theme.inactive.c.bg = '#000000'
theme.normal.c.bg = '#000000'
theme.insert.c.bg = '#000000'
theme.replace.c.bg = '#000000'
theme.visual.c.bg = '#000000'
theme.insert.a.bg = '#8EC07C'

lualine.setup {
    options = {
        icons_enabled = true,
        component_separators = {
            left = '|',
            right = '|'
        },
        section_separators = {
            left = '',
            right = ''
        },
        disabled_filetypes = {},
        theme = theme
    },
    sections = {
        lualine_a = {
            'mode'
        },
        lualine_b = {
            'branch'
        },
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = {
            {
                'diagnostics', sources = {
                    "nvim_diagnostic"
                },
                symbols = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    hint = ' '
                }
            },
            'encoding',
            'filetype'
        },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'location'
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
        lualine_x = {
            'location'
        },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        'fugitive'
    }
}
