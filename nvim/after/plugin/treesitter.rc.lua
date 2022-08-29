local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'lua', 'javascript', 'tsx', 'vim', 'fish', 'c', 'c_sharp', 'bash', 'python'
  }
}
