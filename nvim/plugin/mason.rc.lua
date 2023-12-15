local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({})
mason_lsp.setup({
	ensure_installed = {
		"astro",
		"bashls",
		"clangd",
		"csharp_ls",
		"cssls",
		"html",
		"jdtls",
		"ltex",
		"lua_ls",
		"pylsp",
		"rust_analyzer",
		"sqlls",
		"taplo",
		"tsserver",
	},
})
