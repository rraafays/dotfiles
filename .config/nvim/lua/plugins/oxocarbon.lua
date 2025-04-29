return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme oxocarbon]])
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#FFE97B", fg = "#000000" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" }) -- Change gutter color
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080", bg = "#000000" }) -- Change line numbers color
  end,
}
