local opts = { noremap = true, silent = true }

-- space on steroids
vim.keymap.set('n', '<Space>k', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<Space>l', 'viw:MoveHBlock(1)<CR><Esc>', opts)
vim.keymap.set('n', '<Space>j', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<Space>h', 'viw:MoveHBlock(-1)<CR><Esc>', opts)
vim.keymap.set('v', '<Space>k', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<Space>l', ':MoveHBlock(1)<CR>', opts)
vim.keymap.set('v', '<Space>j', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<Space>h', ':MoveHBlock(-1)<CR>', opts)
