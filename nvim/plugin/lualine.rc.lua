local lualine = require("lualine")

local wm_theme = require("lualine.themes.gruvbox")
local tty_theme = require("lualine.themes.16color")

wm_theme.normal.a.fg = "#A89983"
wm_theme.insert.a.fg = "#448488"
wm_theme.replace.a.fg = "#FB4833"
wm_theme.visual.a.fg = "#FE8019"
wm_theme.normal.a.bg = "#00000C"
wm_theme.insert.a.bg = "#000000"
wm_theme.replace.a.bg = "#000000"
wm_theme.visual.a.bg = "#000000"

wm_theme.inactive.b.fg = "#EBDBB2"
wm_theme.normal.b.fg = "#EBDBB2"
wm_theme.insert.b.fg = "#EBDBB2"
wm_theme.replace.b.fg = "#EBDBB2"
wm_theme.visual.b.fg = "#EBDBB2"
wm_theme.inactive.b.bg = "#000000"
wm_theme.normal.b.bg = "#000000"
wm_theme.insert.b.bg = "#000000"
wm_theme.replace.b.bg = "#000000"
wm_theme.visual.b.bg = "#000000"

wm_theme.inactive.c.fg = "#A89983"
wm_theme.normal.c.fg = "#A89983"
wm_theme.insert.c.fg = "#A89983"
wm_theme.replace.c.fg = "#A89983"
wm_theme.visual.c.fg = "#A89983"
wm_theme.inactive.c.bg = "#000000"
wm_theme.normal.c.bg = "#000000"
wm_theme.insert.c.bg = "#000000"
wm_theme.replace.c.bg = "#000000"
wm_theme.visual.c.bg = "#000000"

tty_theme.normal.a.bg = "#000000"
tty_theme.insert.a.bg = "#000000"
tty_theme.visual.a.bg = "#000000"
tty_theme.replace.a.bg = "#000000"

local function get_theme()
	if os.getenv("DISPLAY") == nil then
		return tty_theme
	else
		return wm_theme
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		component_separators = {
			left = "|",
			right = "|",
		},
		section_separators = {
			left = "",
			right = "",
		},
		disabled_filetypes = {},
		theme = get_theme,
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			"branch",
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = {
					"nvim_diagnostic",
				},
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = "󰌵 ",
				},
			},
			"encoding",
			"filetype",
		},
		lualine_y = {
			"progress",
		},
		lualine_z = {
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_x = {
			"location",
		},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {
		"fugitive",
	},
})
