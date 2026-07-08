return {
  {
    "folke/which-key.nvim",
    opts = {
      delay = function()
        return 0
      end,
      spec = {
        { "<leader>R", group = "HTTP (Kulala)", icon = { icon = "󰒔", color = "blue" } },
        { "<leader>Z", group = "Strudel", icon = { icon = "󰎈", color = "purple" } },
      },
    },
  },
}
