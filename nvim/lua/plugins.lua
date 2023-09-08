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
local status, lazy = pcall(require, "lazy")
if not status then
	print("Lazy is not installed")
	return
end

-- starts lazy
lazy.setup({
	defaults = { lazy = true },

	"ellisonleao/gruvbox.nvim", -- gruvbox theme
	"hoob3rt/lualine.nvim", -- statusline
	"kyazdani42/nvim-web-devicons", -- icons
	"onsails/lspkind-nvim", -- pictograms
	"lewis6991/gitsigns.nvim", -- git changes
	"folke/zen-mode.nvim", -- zen coding
	"nvim-treesitter/nvim-treesitter", -- code highlighting
	"l3mon4d3/luasnip", -- code snippets
	"nvim-telescope/telescope.nvim", -- fuzzy finder
	"goolord/alpha-nvim", -- startpage
	"neovim/nvim-lspconfig", -- language servers
	"williamboman/mason.nvim", -- language server installer
	"williamboman/mason-lspconfig.nvim", -- lsp configurator
	"hrsh7th/nvim-cmp", -- language completions
	"hrsh7th/cmp-buffer", -- cmp buffer words
	"hrsh7th/cmp-nvim-lsp", -- cmp lsp
	"glepnir/lspsaga.nvim", -- language server uis
	"rust-lang/rust.vim", -- rust configuration
	"simrat39/rust-tools.nvim", -- rust devtools
	"saecki/crates.nvim", -- better crates support
	"windwp/nvim-autopairs", -- auto closing marks
	"windwp/nvim-ts-autotag", -- auto closing tags
	"kylechui/nvim-surround", -- surround function
	"numtostr/comment.nvim", -- comment manipulation
	"lervag/vimtex", -- live tex compiling
	"nvim-telescope/telescope-file-browser.nvim", -- file explorer
	"nvim-lua/plenary.nvim", -- file utilities
	"RaafatTurki/hex.nvim", -- hex editor
	"ahmedkhalf/project.nvim", -- project management
	"mfussenegger/nvim-dap", -- debug adapter protocol
	"rcarriga/nvim-dap-ui", -- debug adapter protocol uis
	"mhartington/formatter.nvim", -- easy formatter config
	"norcalli/nvim-colorizer.lua", -- colour highlighter
	"kevinhwang91/promise-async", -- promise & async
	"kevinhwang91/nvim-ufo", -- smart folding
	"MunifTanjim/nui.nvim", -- nvim ui library
	"jackMort/ChatGPT.nvim", -- chatgpt
	"LunarVim/bigfile.nvim", -- speed up big files
	"christoomey/vim-tmux-navigator", -- seamless vi & tmux
})
