local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		javascript = { "prettier" },
		xml = { "tidy" },
		sql = { "sql_formatter" },
		-- java = { "intellij" },
	},
	formatters = {
		intellij = {
			command = "idea",
			require_cwd = true,
			stdin = false,
			args = { "format", "-s", os.getenv("HOME") .. "/.config/nvim/etc/intellij.xml", "$FILENAME" },
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

local slow_format_filetypes = { "java" }
require("conform").setup({
	format_on_save = function(bufnr)
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,

	format_after_save = function(bufnr)
		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = true }
	end,
})
