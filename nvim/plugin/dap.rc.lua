local status, dap = pcall(require, 'dap')
if (not status) then return end

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DiagnosticSignError', linehl='', numhl=''})

dap.adapters.lldb = {
  type = 'executable',
  command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/codelldb",
  name = 'lldb'
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  }
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust
