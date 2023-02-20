local status, git = pcall(require, 'git')
if (not status) then return end

git.setup {
  keymaps = {
    blame = 'gb', -- open blame window
    quit_blame = '<Esc>', -- quit blame window
    diff = 'gd', -- open diff window
    diff_close = '<Esc>', -- quit diff window
    browse = 'gr' -- open file or folder in repo
  }
}
