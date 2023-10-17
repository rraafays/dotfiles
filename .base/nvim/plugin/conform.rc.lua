local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		["*"] = { "trim_whitespace" },
		lua = { "stylua" },
		sql = { "sqlfmt" },
		xml = { "tidy" },
		java = {
			command = "clang-format",
			args = { "--style=Google", "--assume-filename=.java" },
		},
		javascript = {
			command = "prettier",
			args = { "--tab-width 2" },
		},
		sh = {
			command = { "shfmt" },
			args = { "-i", 2 },
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
