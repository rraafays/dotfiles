local telescope = require("telescope")
local actions = require('telescope.actions')
local fb_actions = require 'telescope'.extensions.file_browser.actions

function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            theme = 'dropdown',
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ['N'] = fb_actions.create,
                    ['h'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<A-f>', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<CR>' , opts)
vim.keymap.set('n', '<A-/>', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
vim.keymap.set('n', '<A-b>', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
vim.keymap.set('n', '<A-d>', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
vim.keymap.set('n', '<A-e>', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "insert", layout_config = { height = 40 } })<CR>' , opts)
