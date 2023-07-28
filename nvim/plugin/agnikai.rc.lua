if os.getenv("DISPLAY") == nil then
	vim.cmd([[ colorscheme default ]])
else
	vim.cmd([[ colorscheme agnikai ]])
end
