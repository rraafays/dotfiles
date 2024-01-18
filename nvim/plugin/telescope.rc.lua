local actions = require("telescope.actions")
local telescope = require("telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

function telescope_buffer_dir() return vim.fn.expand("%:p:h") end

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

local opts = { noremap = true, silent = true }
vim.keymap.set(
    "n",
    "<C-f>",
    '<cmd>lua require("telescope.builtin").find_files({ hidden = true, layout_config={width=0.9, height=0.9} })<CR>',
    opts
)
vim.keymap.set(
    "n",
    "<C-g>",
    '<cmd>lua require("telescope.builtin").live_grep({layout_config={width=0.9, height=0.9}})<CR>',
    opts
)
vim.keymap.set(
    "n",
    "<C-b>",
    '<cmd>lua require("telescope.builtin").buffers({ initial_mode = "normal", layout_config={width=0.9, height=0.9}})<CR>',
    opts
)
vim.keymap.set(
    "n",
    "<C-d>",
    '<cmd>lua require("telescope.builtin").diagnostics({layout_config={width=0.9, height=0.9}})<CR>',
    opts
)
vim.keymap.set(
    "n",
    "<C-e>",
    '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = true, initial_mode = "normal"})<CR>',
    opts
)
vim.keymap.set(
    "n",
    "<A-c>",
    "<cmd>lua require('telescope.builtin').git_commits({ hidden = true, layout_config={width=0.9, height=0.9} })<CR>",
    opts
)
vim.keymap.set(
    "n",
    "<A-b>",
    "<cmd>lua require('telescope.builtin').git_branches({ hidden = true, layout_config={width=0.9, height=0.9} })<CR>",
    opts
)
vim.keymap.set(
    "n",
    "<A-s>",
    "<cmd>lua require('telescope.builtin').git_status({ hidden = true, layout_config={width=0.9, height=0.9} })<CR>",
    opts
)
