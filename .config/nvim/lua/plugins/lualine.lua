return {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.laststatus = 0
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require
    vim.o.laststatus = vim.g.lualine_laststatus
    local colors = {
      black = "#000000",
      gray = "#484f58",
      white = "#e6edf3",
      red = "#ff7b72",
      blue = "#58a6ff",
      yellow = "#d29922",
      magenta = "#bc8cff",
    }
    local gruvbox = {
      normal = {
        a = { bg = colors.black, fg = colors.gray, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
      insert = {
        a = { bg = colors.black, fg = colors.blue, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
      visual = {
        a = { bg = colors.black, fg = colors.yellow, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
      replace = {
        a = { bg = colors.black, fg = colors.red, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.black, fg = colors.white, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
      inactive = {
        a = { bg = colors.black, fg = colors.white, gui = "bold" },
        b = { bg = colors.black, fg = colors.magenta },
        c = { bg = colors.black, fg = colors.white },
      },
    }
    require("lualine").setup({ options = { theme = gruvbox } })
    local opts = {
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = gruvbox,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              "WinEnter",
              "BufEnter",
              "BufWritePost",
              "SessionLoadPost",
              "FileChangedShellPost",
              "VimResized",
              "Filetype",
              "CursorMoved",
              "CursorMovedI",
              "ModeChanged",
            },
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
      }),
    }
    return opts
  end,
}
