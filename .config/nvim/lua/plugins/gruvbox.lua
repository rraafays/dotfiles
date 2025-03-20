return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  config = function()
    vim.o.background = "dark"
    require("gruvbox").setup({
      transparent_mode = false,
      dim_inactive = false,
      italic = {
        emphasis = false,
        strings = false,
        operators = false,
        comments = false,
        folds = false,
      },
      palette_overrides = {
        dark0 = "none",
        dark1 = "none",
        dark2 = "none",
      },
      overrides = {
        Visual = { bg = "#2a1300", fg = "#D65C0D" },
        GitSignsChangeLn = { bg = "#1c1c06" },
        GitSignsAddLn = { bg = "#14200f" },
        GitSignsChangedeleteLn = { bg = "#2d0501" },
        IncSearch = { bg = "#2b1e01", fg = "#FABC2E", reverse = false },
        CurSearch = { bg = "#2b1e01", fg = "#FABC2E", reverse = true },
        Search = { bg = "#2b1e01", fg = "#FABC2E", reverse = false },
        NotifyBackground = { bg = "#000000" },
        NoiceCmdlineIcon = { fg = "#EBDBB2" },
        NoiceCmdlineIconCalculator = { fg = "#EBDBB2" },
        NoiceCmdlineIconCmdline = { fg = "#EBDBB2" },
        NoiceCmdlineIconFilter = { fg = "#EBDBB2" },
        NoiceCmdlineIconHelp = { fg = "#EBDBB2" },
        NoiceCmdlineIconIncRename = { fg = "#EBDBB2" },
        NoiceCmdlineIconInput = { fg = "#EBDBB2" },
        NoiceCmdlineIconLua = { fg = "#EBDBB2" },
        NoiceCmdlineIconSearch = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorder = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderCalculator = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderCmdline = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderFilter = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderHelp = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderIncRename = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderInput = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderLua = { fg = "#EBDBB2" },
        NoiceCmdlinePopupBorderSearch = { fg = "#EBDBB2" },
        NoiceCmdlinePopupTitle = { fg = "#EBDBB2" },
      },
    })
    vim.cmd([[colorscheme gruvbox]])
  end,
}
