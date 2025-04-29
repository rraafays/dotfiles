return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    local theme = {
      inactive = {
        a = { fg = "#33B1FF", bg = "#000000", gui = "bold" },
        b = { fg = "#FF7EB6", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#808080", bg = "#000000" },
      },
      normal = {
        a = { fg = "#808080", bg = "#000000", gui = "bold" },
        b = { fg = "#FF7EB6", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#808080", bg = "#000000" },
      },
      visual = {
        a = { fg = "#BE95FF", bg = "#000000", gui = "bold" },
        b = { fg = "#FF7EB6", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#808080", bg = "#000000" },
      },
      insert = {
        a = { fg = "#33B1FF", bg = "#000000", gui = "bold" },
        b = { fg = "#FF7EB6", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#808080", bg = "#000000" },
      },
      replace = {
        a = { fg = "#EE5396", bg = "#000000", gui = "bold" },
        b = { fg = "#FF7EB6", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
        z = { fg = "#808080", bg = "#000000", gui = "bold" },
      },
      command = { a = { fg = "#FFE97B", bg = "#000000", gui = "bold" } },
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = false,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
