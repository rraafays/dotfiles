local actions = require("telescope.actions")
local telescope = require("telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

function telescope_buffer_dir() return vim.fn.expand("%:p:h") end

telescope.setup({
    defaults = {
        find_command = "rg",
        respect_git_ignore = false,
        hidden = true,
        layout_config = {
            width = 0.9,
            height = 0.9,
        },
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    pickers = {
        buffers = {
            initial_mode = "normal",
        },
    },
    extensions = {
        file_browser = {
            respect_git_ignore = false,
            hidden = true,
            grouped = true,
            initial_mode = "normal",
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd("normal vbd") end,
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
                    ["/"] = function() vim.cmd("startinsert") end,
                },
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("frecency")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<C-d>", "<cmd>Telescope diagnostics<cr>", opts)
vim.keymap.set("n", "<A-c>", "<cmd>Telescope git_bcommits", opts)
vim.keymap.set("n", "<A-b>", "<cmd>Telescope git_branches", opts)
vim.keymap.set("n", "<A-s>", "<cmd>Telescope git_status", opts)
vim.keymap.set("n", "<space>", "<cmd>Telescope frecency<cr>", opts)
vim.keymap.set(
    "n",
    "<a-space>",
    "<cmd>Telescope frecency workspace=CWD<cr>",
    opts
)
vim.keymap.set(
    "n",
    "<C-e>",
    "<cmd>Telescope file_browser file_browser<cr>",
    opts
)
