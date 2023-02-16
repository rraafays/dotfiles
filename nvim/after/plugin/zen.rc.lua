local status, zen = pcall(require, 'true-zen')
if (not status) then return end

local width = vim.api.nvim_win_get_width(0)

zen.setup {
  integrations = {
    lualine = true
  },
  modes = {
    ataraxis = {
      minimum_writing_area = {
        width = width / 3
      },
      padding = {
        left = 10^10,
        right = 10^10,
        top = 0,
        bottom = 0
      },
    }
  }
}

vim.keymap.set('n', 'z', ':TZAtaraxis<CR>', { silent = true })
