return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 9999,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          terminal_colors = false,
          dim_inactive = false,
          module_default = true,
        },
      })

      -- normal
      vim.g.terminal_color_0 = "#0d1116"
      vim.g.terminal_color_1 = "#ff7b72"
      vim.g.terminal_color_2 = "#3fba50"
      vim.g.terminal_color_3 = "#d29922"
      vim.g.terminal_color_4 = "#58a6ff"
      vim.g.terminal_color_5 = "#bc8cff"
      vim.g.terminal_color_6 = "#77e3ea"
      vim.g.terminal_color_7 = "#b1bac4"

      -- bright
      vim.g.terminal_color_8 = "#161b22"
      vim.g.terminal_color_9 = "#ffa198"
      vim.g.terminal_color_10 = "#56d364"
      vim.g.terminal_color_11 = "#e4b340"
      vim.g.terminal_color_12 = "#79c0ff"
      vim.g.terminal_color_13 = "#d2a8ff"
      vim.g.terminal_color_14 = "#b3f0ff"
      vim.g.terminal_color_15 = "#e6edf3"

      vim.cmd("colorscheme github_dark")
    end,
  },
}
