local configs = require("nvim-treesitter.configs")
local treesitter = require("nvim-treesitter")

configs.setup {
    build = ':TSUpdate',
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'lua', 'javascript', 'tsx', 'vim', 'fish', 'c', 'c_sharp', 'bash', 'python', 'markdown', 'markdown_inline', 'astro', 'rust', 'java'
    }
}
