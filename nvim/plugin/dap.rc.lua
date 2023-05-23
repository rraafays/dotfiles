vim.fn.sign_define('DapBreakpoint', {text='', texthl='DiagnosticSignError', linehl='', numhl='DiagnosticSignError'})
vim.keymap.set('n', '<Space>', '<cmd> DapToggleBreakpoint <CR>')
