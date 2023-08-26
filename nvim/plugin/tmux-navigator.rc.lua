vim.cmd([[ let g:tmux_navigator_no_mappings = 1 ]])

vim.cmd([[ noremap <silent> <A-h> :<C-U>TmuxNavigateLeft<cr> ]])
vim.cmd([[ noremap <silent> <A-j> :<C-U>TmuxNavigateDown<cr> ]])
vim.cmd([[ noremap <silent> <A-k> :<C-U>TmuxNavigateUp<cr> ]])
vim.cmd([[ noremap <silent> <A-l> :<C-U>TmuxNavigateRight<cr> ]])
