local pain = require("no-neck-pain")

pain.setup({
	debug = false,
	width = 80,
	minSideBufferWidth = 0,
	disableOnLastBuffer = true,
	killAllBuffersOnDisable = true,
	autocmds = {
		enableOnVimEnter = true,
		enableOnTabEnter = true,
		reloadOnColorSchemeChange = true,
	},
	mappings = {
		enabled = true,
		toggle = "z",
		widthUp = "=",
		widthDown = "-",
		scratchPad = "false",
	},
})

vim.api.nvim_create_user_command('Center',function()
    local length = io.popen("wc -L " .. vim.fn.expand("%:p") .. " | tr -s ' ' | cut -d ' ' -f 2")
    local result = length:read("*a")
    print(result)
    vim.cmd("NoNeckPainResize " .. result + 8)
end,{})
