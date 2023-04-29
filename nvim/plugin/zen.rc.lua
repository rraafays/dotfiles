local status, zen = pcall(require, 'zen-mode')
if (not status) then return end

zen.setup {
  window = {
    backdrop = 1,
    width = .5,
    height = 1,
    options = {
      number = false,
      signcolumn = 'no'
    }
  },
  plugins = {
    options = { showcmd = false, ruler = false},
    twilight = { enabled = false },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    kitty = { enabled = false },
    alacritty = { enabled = false }
  },
  on_open = function() vim.cmd([[ set laststatus=0 ]]) end,
  on_close = function() vim.cmd([[ set laststatus=2 ]]) end
}

vim.keymap.set('n', 'z', ':ZenMode<CR>', { silent = true })
