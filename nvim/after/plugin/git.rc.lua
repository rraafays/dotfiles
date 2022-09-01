local status, git = pcall(require, 'git')
if (not status) then return end

git.setup {
  keymaps = {
    blame = 'gb', -- open blame window
    browse = 'ge' -- open file or folder in repo
  }
}
