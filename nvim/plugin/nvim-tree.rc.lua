local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "+",
					open = "-",
					empty = " ",
					empty_open = " ",
					symlink = "-",
					symlink_open = "+",
				},
				git = {
					unstaged = " !",
					staged = " +",
					unmerged = " ",
					renamed = " >>",
					untracked = " ?",
					deleted = " x",
					ignored = "",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "󰌵 ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	view = {
		width = 25,
		side = "left",
	},
})

vim.keymap.set("n", "<A-t>", ":NvimTreeToggle<CR>")
