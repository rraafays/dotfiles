local nvim_tree = require("nvim-tree")

local function set_custom_bindings(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "q", ":NvimTreeClose<CR>:q<CR>", opts("Up"))
end

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	on_attach = set_custom_bindings,
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
