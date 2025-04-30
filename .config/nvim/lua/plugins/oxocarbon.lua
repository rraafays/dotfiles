return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme oxocarbon]])
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#FFE97B", fg = "#000000" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#525252", bg = "#000000" })

    vim.api.nvim_set_hl(0, "Error", {
      fg = "#EE5396",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "String", {
      fg = "#42BE65",
      bold = false,
    })

    vim.api.nvim_set_hl(0, "Structure", {
      fg = "#42BE65",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@tag", {
      fg = "#EE5396",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "Type", {
      fg = "#BE95FF",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@constant", {
      fg = "#FFE97B",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@property", {
      fg = "#FFFFFF",
      bold = false,
    })

    vim.api.nvim_set_hl(0, "Operator", {
      fg = "#FFE97B",
      bold = false,
    })

    vim.api.nvim_set_hl(0, "@punctuation.bracket.rust", {
      fg = "#FFE97B",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@constructor", {
      fg = "#FFE97B",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@punctuation.bracket", {
      fg = "#FFE97B",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@punctuation.special", {
      fg = "#FFE97B",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@punctuation.delimiter", {
      fg = "#FFE97B",
      bold = true,
    })
  end,
}
