local status, icons = pcall(require, 'nvim-web-devicons')
if (not status) then return end

icons.setup {
  override = {
    rs = {
      icon = '',
      color = '#F74C00',
      cterm_color = '#F74C00',
      name = 'rust'
    }
  }
}
