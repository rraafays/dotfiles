local status, case = pcall(require, 'textcase')
if (not status) then return end

-- snake_case current word
vim.keymap.set('n', 'snake', ':lua require(\'textcase\').current_word(\'to_snake_case\')<CR>')
-- SCREAMING_SNAKE_CASE current word
vim.keymap.set('n', 'snaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaaaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
vim.keymap.set('n', 'snaaaaaaaaaake', ':lua require(\'textcase\').current_word(\'to_constant_case\')<CR>')
