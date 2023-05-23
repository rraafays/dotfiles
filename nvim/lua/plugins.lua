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
    -- aesthetic
    'hoob3rt/lualine.nvim', -- statusline
    'ellisonleao/gruvbox.nvim', -- theme
    'kyazdani42/nvim-web-devicons', -- icons
    'norcalli/nvim-colorizer.lua', -- colour highlights
    'onsails/lspkind-nvim', -- pictograms

    -- interface
    'lewis6991/gitsigns.nvim', -- git changes
    'folke/zen-mode.nvim', -- zen coding
    'nvim-treesitter/nvim-treesitter', -- code highlighting
    'l3mon4d3/luasnip', -- code snippets
    'nvim-telescope/telescope.nvim', -- fuzzy finder

    -- language server
    'neovim/nvim-lspconfig', -- language servers
    'williamboman/mason.nvim', -- language server installer
    'williamboman/mason-lspconfig.nvim', -- lsp configurator
    'hrsh7th/nvim-cmp', -- language completions
    'hrsh7th/cmp-buffer', -- cmp buffer words
    'hrsh7th/cmp-nvim-lsp', -- cmp lsp
    'glepnir/lspsaga.nvim', -- language server uis
    'mfussenegger/nvim-dap', -- debug adaptor

    -- rust
    'rust-lang/rust.vim', --
    'simrat39/rust-tools.nvim',
    'saecki/crates.nvim',

    -- quality of life
    'windwp/nvim-autopairs', -- auto closing marks
    'windwp/nvim-ts-autotag', -- auto closing tags
    'kylechui/nvim-surround', -- surround function
    'numtostr/comment.nvim', -- comment manipulation

    -- miscellaneous
    'lervag/vimtex', -- live tex compiling
    'nvim-telescope/telescope-file-browser.nvim', -- file explorer
    'nvim-lua/plenary.nvim' -- file utilities
})
