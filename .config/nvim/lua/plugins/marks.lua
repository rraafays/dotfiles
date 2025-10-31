return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("marks").setup({
      default_mappings = false,
      builtin_marks = { ".", "<", ">", "^", '"', "'" },
      excluded_filetypes = {},
      excluded_buftypes = {},
      mappings = {},
    })

    vim.api.nvim_set_hl(0, "MarkSignHL", { fg = "#d29922", bold = true })
  end,
}
