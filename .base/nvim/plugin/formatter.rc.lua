local defaults = require("formatter.defaults")
local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		java = {
			function()
				return {
					exe = "clang-format",
					args = { "--style=Google", "--assume-filename=.java" },
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
						"--tab-width 2",
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		sh = {
			function()
				return {
					exe = "shfmt",
					args = { "-i", 2 },
					stdin = true,
				}
			end,
		},
		xml = {
			require("formatter.filetypes.xml").tidy,
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
