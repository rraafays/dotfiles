local project = require("project_nvim")

require('telescope').load_extension('projects')

vim.keymap.set('n', '<A-p>', '<cmd>lua require"telescope".extensions.projects.projects{ initial_mode = "normal" }<CR>')

project.setup {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

    ignore_lsp = {},
    exclude_dirs = {},

    show_hidden = true,
    silent_chdir = true,

    scope_chdir = 'global',

    datapath = vim.fn.stdpath("data"),
}
