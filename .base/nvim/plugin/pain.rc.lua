local pain = require("no-neck-pain")

pain.setup({
	debug = false,
	width = 80,
	minSideBufferWidth = 0,
	disableOnLastBuffer = false,
	killAllBuffersOnDisable = false,
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
