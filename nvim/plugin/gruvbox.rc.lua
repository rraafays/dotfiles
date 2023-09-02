local gruvbox = require("gruvbox")

gruvbox.setup({
	italic = {
		strings = false,
		operators = false,
		comments = false,
		folds = false,
	},
	invert_selection = true,
	palette_overrides = {
		dark0 = "none",
		dark1 = "none",
		dark2 = "none",
	},
})

if os.getenv("DISPLAY") == nil then
	vim.cmd([[ colorscheme default ]])
else
	vim.cmd([[ colorscheme gruvbox ]])
end
