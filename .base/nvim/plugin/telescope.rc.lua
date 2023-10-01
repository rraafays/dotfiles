local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["n"] = fb_actions.create,
					["m"] = fb_actions.move,
					["r"] = fb_actions.rename,
					["c"] = fb_actions.copy,
					["x"] = fb_actions.remove,
					["h"] = fb_actions.goto_parent_dir,
					["l"] = fb_actions.change_cwd,
					["~"] = fb_actions.goto_cwd,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-f>", '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<CR>', opts)
vim.keymap.set("n", "<C-g>", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
vim.keymap.set("n", "<C-b>", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
vim.keymap.set("n", "<C-d>", '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
vim.keymap.set(
	"n",
	"<C-e>",
	'<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = true, initial_mode = "normal"})<CR>',
	opts
)
