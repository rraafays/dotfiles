return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,
  priority = 9999,
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true,
      },
    })
    vim.cmd("colorscheme github_dark_default")
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
    vim.opt.fillchars = { eob = " " }

    vim.api.nvim_set_hl(0, "Visual", { bg = "#FFFFFF", fg = "#000000" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "Cursor", { bg = "#FFFFFF", fg = "#000000" })
  end,
}
