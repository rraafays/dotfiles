local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'E', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '?', '<Cmd>Lspsaga hover_doc<CR>', opts)
