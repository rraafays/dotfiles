local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		javascript = { "prettier" },
		xml = { "tidy" },
		sql = { "sql_formatter" },
		java = { "intellij" },
	},
	formatters = {
		intellij = {
			command = "idea",
			require_cwd = true,
			stdin = false,
			args = { "format", "-s", "/Users/raf/Downloads/odyssey.xml", "$FILENAME" },
		},
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 50000,
	},
	format_after_save = {
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
