vim.fn.sign_define('DapBreakpoint', {text='', texthl='DiagnosticSignError', linehl='', numhl='DiagnosticSignError'})
vim.keymap.set('n', '<Space>', '<cmd> DapToggleBreakpoint <CR>')

local status, dap = pcall(require, 'nvim-dap')
if (not status) then return end

dap.setup { }
