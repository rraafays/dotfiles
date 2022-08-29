-- function used to check if packer is installed
local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

-- starts packer and includes my plugins
packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'hoob3rt/lualine.nvim' } -- statusline
  use { 'neovim/nvim-lspconfig' } -- language server protocol
  use { 'williamboman/mason.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' } -- catppuccin theme
end)
