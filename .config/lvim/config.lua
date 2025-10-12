-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.cmdheight = 0;
vim.opt.showtabline = 0

lvim.plugins = {
  {
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
      lvim.colorscheme = "github_dark_default"
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
      --vim.opt.fillchars = { eob = " " }

      vim.api.nvim_set_hl(0, "Visual", { bg = "#FFFFFF", fg = "#000000" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "Cursor", { bg = "#FFFFFF", fg = "#000000" })
    end,
    },
}

    local theme = {
      inactive = {
        a = { fg = "#33B1FF", bg = "#000000", gui = "bold" },
        b = { fg = "#bc8cff", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#484f58", bg = "#000000" },
      },
      normal = {
        a = { fg = "#484f58", bg = "#000000", gui = "bold" },
        b = { fg = "#bc8cff", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#484f58", bg = "#000000" },
      },
      visual = {
        a = { fg = "#d29922", bg = "#000000", gui = "bold" },
        b = { fg = "#bc8cff", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#484f58", bg = "#000000" },
      },
      insert = {
        a = { fg = "#58a6ff", bg = "#000000", gui = "bold" },
        b = { fg = "#bc8cff", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000" },
        z = { fg = "#484f58", bg = "#000000" },
      },
      replace = {
        a = { fg = "#ff7b72", bg = "#000000", gui = "bold" },
        b = { fg = "#bc8cff", bg = "#000000", gui = "bold" },
        c = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
        z = { fg = "#484f58", bg = "#000000", gui = "bold" },
      },
      command = { a = { fg = "#BE95FF", bg = "#000000", gui = "bold" } },
    }
lvim.builtin.lualine.options.theme = theme
lvim.builtin.illuminate.active = false
