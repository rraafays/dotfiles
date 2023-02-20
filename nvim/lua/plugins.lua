local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- function used to check if lazy is installed
local status, lazy = pcall(require, 'lazy')
if (not status) then
  print("Lazy is not installed")
  return
end

-- starts lazy
lazy.setup({
    defaults = { lazy = true },
     'l3mon4d3/luasnip', --snippets for completions
     'hoob3rt/lualine.nvim', -- replacement statusline
     'onsails/lspkind-nvim', -- vscode style pictograms
     'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
     'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built in lsp
     'hrsh7th/nvim-cmp', -- language completions
     'neovim/nvim-lspconfig', -- language server protocol
     'williamboman/mason.nvim', -- language server installer
     'windwp/nvim-autopairs', -- auto closing brackets and quotations
     'windwp/nvim-ts-autotag', -- auto closing typescript tags
     'ellisonleao/gruvbox.nvim', -- gruvbox theme
     'nvim-treesitter/nvim-treesitter', -- accurate code tree highlighting
     'nvim-lua/plenary.nvim', -- common file utilities
     'nvim-telescope/telescope.nvim', -- fuzzy finder
     'nvim-telescope/telescope-file-browser.nvim', -- file explorer
     'kyazdani42/nvim-web-devicons', -- file icons
     'norcalli/nvim-colorizer.lua', -- colour highlights hex, rgb and more
     'glepnir/lspsaga.nvim', -- lsp uis
     'lewis6991/gitsigns.nvim', -- git markers
     'dinhhuy258/git.nvim', -- git blame & browse
     'kevinhwang91/promise-async', -- promise and async
     'lervag/vimtex', -- latex auto compiler
     'folke/zen-mode.nvim', -- zen mode
     'elkowar/yuck.vim', -- yuck lsp
     'muniftanjim/nui.nvim', -- ui library
     'jackmort/chatgpt.nvim', -- chatgpt querying
     'kylechui/nvim-surround' -- surround items
})
