return {
  "folke/which-key.nvim",
  config = function()
    local snacks = require("snacks")
    local wk = require("which-key")

    vim.keymap.set("n", "<C-f>", function()
      snacks.picker.git_files()
    end, { desc = "Find git files" })

    wk.register({
      ["<C-f>"] = {
        function()
          snacks.picker.git_files()
        end,
        "Find git files",
      },
    })
  end,
}
