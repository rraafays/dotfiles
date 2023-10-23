local lualine = require("lualine")

local theme = require("lualine.themes.gruvbox")

local function search_term()
	local res = vim.fn.searchcount()
	if res.total > 0 then
		return string.format("/ %s/%d", res.current, res.total)
	else
		return ""
	end
end

theme.normal.a.fg = "#A89983"
theme.insert.a.fg = "#448488"
theme.replace.a.fg = "#FB4833"
theme.visual.a.fg = "#FE8019"
theme.normal.a.bg = "none"
theme.insert.a.bg = "none"
theme.replace.a.bg = "none"
theme.visual.a.bg = "none"

theme.inactive.b.fg = "#EBDBB2"
theme.normal.b.fg = "#EBDBB2"
theme.insert.b.fg = "#EBDBB2"
theme.replace.b.fg = "#EBDBB2"
theme.visual.b.fg = "#EBDBB2"
theme.inactive.b.bg = "none"
theme.normal.b.bg = "none"
theme.insert.b.bg = "none"
theme.replace.b.bg = "none"
theme.visual.b.bg = "none"

theme.inactive.c.fg = "#A89983"
theme.normal.c.fg = "#A89983"
theme.insert.c.fg = "#A89983"
theme.replace.c.fg = "#A89983"
theme.visual.c.fg = "#A89983"
theme.inactive.c.bg = "none"
theme.normal.c.bg = "none"
theme.insert.c.bg = "none"
theme.replace.c.bg = "none"
theme.visual.c.bg = "none"

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
		theme = theme,
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
				search_term,
				-- color = { gui = "bold" },
			},
			{
				"diagnostics",
				sources = {
					"nvim_diagnostic",
				},
				symbols = {
					error = "[ERROR] ",
					warn = "[WARN] ",
					info = "[INFO] ",
					hint = "[NOTE] ",
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
