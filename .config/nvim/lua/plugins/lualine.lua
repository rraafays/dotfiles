return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local theme = require("lualine.themes.gruvbox")

    theme.normal.a.fg = "#A89983"
    theme.insert.a.fg = "#448488"
    theme.replace.a.fg = "#FB4833"
    theme.visual.a.fg = "#D65C0D"
    theme.command.a.fg = "#B8BA25"
    theme.normal.a.bg = "none"
    theme.insert.a.bg = "none"
    theme.replace.a.bg = "none"
    theme.visual.a.bg = "none"
    theme.command.a.bg = "none"

    theme.inactive.b.fg = "#EBDBB2"
    theme.normal.b.fg = "#EBDBB2"
    theme.insert.b.fg = "#EBDBB2"
    theme.replace.b.fg = "#EBDBB2"
    theme.visual.b.fg = "#EBDBB2"
    theme.command.b.fg = "#EBDBB2"
    theme.inactive.b.bg = "none"
    theme.normal.b.bg = "none"
    theme.insert.b.bg = "none"
    theme.replace.b.bg = "none"
    theme.visual.b.bg = "none"
    theme.command.b.bg = "none"

    theme.inactive.c.fg = "#A89983"
    theme.normal.c.fg = "#A89983"
    theme.insert.c.fg = "#A89983"
    theme.replace.c.fg = "#A89983"
    theme.visual.c.fg = "#A89983"
    theme.command.c.fg = "#A89983"
    theme.inactive.c.bg = "none"
    theme.normal.c.bg = "none"
    theme.insert.c.bg = "none"
    theme.replace.c.bg = "none"
    theme.visual.c.bg = "none"
    theme.command.c.bg = "none"

    lualine.setup({
      options = {
        theme = theme,
      },
    })
  end,
}
