local defaults = require("formatter.defaults")
local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		java = {
			function()
				return {
					exe = "google-java-format",
					args = "--aosp",
					stdin = true,
				}
			end,
		},
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--tab-width 4",
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.cmd([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END
]])
