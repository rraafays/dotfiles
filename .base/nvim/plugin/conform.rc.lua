local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		xml = { "tidy" },
		sql = { "redgate" },
		java = { "intellij" },
	},
	formatters = {
		intellij = {
			command = "idea",
			require_cwd = false,
			stdin = false,
			args = { "format", "-s", os.getenv("HOME") .. "/.config/nvim/etc/intellij.xml", "$FILENAME" },
		},
		redgate = {
			command = "sql-formatter",
			stdin = true,
			args = { "--config", os.getenv("HOME") .. "/.config/nvim/etc/redgate.json" },
		},
		prettier = {
			command = "prettier",
			stdin = true,
			args = { "--tab-width", 4, "--stdin-filepath", "$FILENAME" },
		},
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 50000,
	},
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
