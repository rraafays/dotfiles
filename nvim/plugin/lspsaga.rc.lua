local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.setup({
  server_filetype_map = {},
  symbol_in_winbar = {
    enable = false
  },
  code_action_lightbulb = {
    enable = false
  },
  ui = {
    border = 'single',
    colors = {
      normal_bg = '#282828',
      title_bg = '#EBDBB2',
      red = '#fb4833',
      green = '#b8ba25',
      yellow = '#fabc2e',
      blue = '#83a597',
      magenta = '#d3859a',
      cyan = '#8ec07b',
      white = '#ebdbb2',
      black = '#282828',
    }
  }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'E', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '?', '<Cmd>Lspsaga hover_doc<CR>', opts)
