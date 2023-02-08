local status, zen = pcall(require, 'true-zen')
if (not status) then return end

zen.setup {
  integrations = {
    lualine = true
  },
  modes = {
    ataraxis = {
      padding = {
        left = 100,
        right = 100,
        top = 0,
        bottom = 0
      }
    }
  }
}

vim.keymap.set('n', 'z', ':TZAtaraxis<CR>')
