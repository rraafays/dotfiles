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

local status, lazy = pcall(require, "lazy")
if not status then
    print("Lazy is not installed")
    return
end

lazy.setup({
    defaults = { lazy = true },

    "ellisonleao/gruvbox.nvim", -- gruvbox theme
    "hoob3rt/lualine.nvim", -- statusline
    "kyazdani42/nvim-web-devicons", -- icons
    "onsails/lspkind-nvim", -- pictograms
    "lewis6991/gitsigns.nvim", -- git changes
    "nvim-treesitter/nvim-treesitter", -- code highlighting
    "l3mon4d3/luasnip", -- code snippets
    "nvim-telescope/telescope.nvim", -- fuzzy finder
    "goolord/alpha-nvim", -- startpage
    "neovim/nvim-lspconfig", -- language servers
    "williamboman/mason.nvim", -- lsp installer
    "williamboman/mason-lspconfig.nvim", -- ensure installed
    "hrsh7th/nvim-cmp", -- lsp completions
    "hrsh7th/cmp-buffer", -- buffer words
    "hrsh7th/cmp-nvim-lsp", -- cmp lsp support
    "glepnir/lspsaga.nvim", -- lsp uis
    "rust-lang/rust.vim", -- rust configuration
    "simrat39/rust-tools.nvim", -- rust devtools
    "saecki/crates.nvim", -- crates support
    "windwp/nvim-autopairs", -- auto closing marks
    "windwp/nvim-ts-autotag", -- auto closing tags
    "kylechui/nvim-surround", -- surround function
    "numtostr/comment.nvim", -- comment toggling
    "lervag/vimtex", -- live tex compiler
    "nvim-telescope/telescope-file-browser.nvim", -- file explorer
    "nvim-lua/plenary.nvim", -- file utilities
    "RaafatTurki/hex.nvim", -- hex editor
    "ahmedkhalf/project.nvim", -- project management
    "mfussenegger/nvim-dap", -- debug adapter
    "rcarriga/nvim-dap-ui", -- dap uis
    "norcalli/nvim-colorizer.lua", -- colour highlighter
    "kevinhwang91/promise-async", -- promise & async
    "MunifTanjim/nui.nvim", -- nvim ui library
    "LunarVim/bigfile.nvim", -- speed up big files
    "gentoo/gentoo-syntax", -- gentoo syntax
    "shortcuts/no-neck-pain.nvim", -- center code
    "stevearc/conform.nvim", -- formatters
    "mfussenegger/nvim-jdtls", -- jdtls
    "jbyuki/venn.nvim", -- diagrams
    "MunifTanjim/nui.nvim", -- ui components
    "rcarriga/nvim-notify", -- notify
    "folke/noice.nvim", -- new ui
    "nvim-pack/nvim-spectre", -- find & replace
})
