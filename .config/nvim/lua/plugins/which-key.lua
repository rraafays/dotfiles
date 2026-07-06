-- Extends LazyVim's which-key spec with custom leader groups.
-- Leader key is Space (see lua/config/options.lua); which-key only surfaces
-- keymaps registered with a `desc` and leader-prefixed prefixes by default.
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>R", group = "HTTP (Kulala)", icon = { icon = "󰒔", color = "blue" } },
      },
    },
  },
}
