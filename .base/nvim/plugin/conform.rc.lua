local conform = require("conform")

conform.setup({
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		xml = { "tidy" },
		sql = { "sql_formatter" },
		-- java = {
		-- 	command = "clang-format",
		-- 	args = { "--style=Google", "--assume-filename=.java" },
		-- },
		-- javascript = {
		-- 	command = "prettier",
		-- 	args = { "--tab-width 2" },
		-- },
		-- sh = {
		-- 	command = { "shfmt" },
		-- 	args = { "-i", 2 },
		-- },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
