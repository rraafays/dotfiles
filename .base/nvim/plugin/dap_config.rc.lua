require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<space>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "dx", ":DapTerminate<CR>")
vim.keymap.set("n", "do", ":DapStepOver<CR>")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" })
