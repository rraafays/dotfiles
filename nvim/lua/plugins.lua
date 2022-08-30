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
  use { 'l3mon4d3/luasnip' } --snippets for completions
  use { 'hoob3rt/lualine.nvim' } -- replacement statusline
  use { 'onsails/lspkind-nvim' } -- vscode style pictograms
  use { 'hrsh7th/cmp-buffer' } -- nvim-cmp source for buffer words
  use { 'hrsh7th/cmp-nvim-lsp' } -- nvim-cmp source for neovim's built in lsp
  use { 'hrsh7th/nvim-cmp' } -- language completions
  use { 'neovim/nvim-lspconfig' } -- language server protocol
  use { 'williamboman/mason.nvim' } -- language server installer
  use { 'windwp/nvim-autopairs' } -- auto closing brackets and quotations
  use { 'windwp/nvim-ts-autotag' } -- auto closing typescript tags
  use { 'ellisonleao/gruvbox.nvim' } -- gruvbox theme
  use { 'nvim-treesitter/nvim-treesitter' } -- accurate code tree highlighting
  use { 'nvim-lua/plenary.nvim' } -- common file utilities
  use { 'nvim-telescope/telescope.nvim' } -- fuzzy finder
  use { 'nvim-telescope/telescope-file-browser.nvim' } -- companion file explorer for telescope
  use { 'kyazdani42/nvim-web-devicons' } -- file icons
end)
