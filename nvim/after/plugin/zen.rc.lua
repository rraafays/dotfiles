local status, zen = pcall(require, 'true-zen')
if (not status) then return end

zen.setup {
  integrations = {
    lualine = true
  },
  modes = {
    ataraxis = {
      minimum_writing_area = {
              width = 100
      },
      padding = {
        left = 10000,
        right = 10000,
        top = 0,
        bottom = 0
      },
      callbacks = {
        open_pre = function() vim.api.nvim_command('IndentBlanklineDisable') end,
        close_pre = function() vim.api.nvim_command('IndentBlanklineEnable') end,
      }
    }
  }
}

vim.keymap.set('n', 'z', ':TZAtaraxis<CR>', { silent = true })
