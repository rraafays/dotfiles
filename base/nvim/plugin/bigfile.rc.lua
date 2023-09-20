local bigfile = require("bigfile")

bigfile.setup({
	filesize = 2, -- MiB
	pattern = { "*" },
	features = { -- disable
		"lsp",
		"treesitter",
		"vimopts",
	},
})
