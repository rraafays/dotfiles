local status, configs = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

local status, treesitter = pcall(require, 'nvim-treesitter')
if (not status) then return end

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
    'lua', 'javascript', 'tsx', 'vim', 'fish', 'c', 'c_sharp', 'bash', 'python', 'markdown', 'markdown_inline', 'astro', 'rust'
  }
}
