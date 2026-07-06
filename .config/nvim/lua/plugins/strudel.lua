-- Strudel live coding (strudel.cc) via Puppeteer + Chrome. Lazy-loaded for `.str` / `.std` only.
-- Depends on config.strudel-nix (Nix shell), strudel-filetype (filetype registration), and strudel-lsp.
return {
  "gruvw/strudel.nvim",
  ft = { "strudel" },
  cmd = { "StrudelBuild", "StrudelHealth", "StrudelCleanup" },
  keys = {
    { "<leader>Zl", desc = "Launch Strudel",                ft = "strudel" },
    { "<leader>Zq", desc = "Quit Strudel",                  ft = "strudel" },
    { "<leader>Zt", desc = "Strudel Toggle Play/Stop",      ft = "strudel" },
    { "<leader>Zu", desc = "Strudel Update",                ft = "strudel" },
    { "<leader>Zs", desc = "Strudel Stop Playback",         ft = "strudel" },
    { "<leader>Zb", desc = "Strudel Set Current Buffer",    ft = "strudel" },
    { "<leader>Zx", desc = "Strudel Set Buffer and Update", ft = "strudel" },
  },
  build = function(plugin)
    require("config.strudel-nix").build(plugin.dir, { notify = false })
  end,
  config = function(plugin)
    local strudel_nix = require("config.strudel-nix")
    local strudel = require("strudel")

    strudel.setup({
      ui = {
        maximise_menu_panel = true,
      },
      start_on_launch = false,
      sync_cursor = true,
      report_eval_errors = true,
      browser_exec_path = strudel_nix.chrome_path(),
      browser_data_dir = strudel_nix.browser_data_dir(),
      headless = true
    })

    strudel_nix.setup_lifecycle(strudel)

    local launch = strudel_nix.wrap_launch(strudel, plugin.dir)
    local quit = strudel_nix.wrap_quit(strudel)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>Zl", launch, vim.tbl_extend("force", opts, { desc = "Launch Strudel" }))
    map("n", "<leader>Zq", quit, vim.tbl_extend("force", opts, { desc = "Quit Strudel" }))
    map("n", "<leader>Zt", strudel.toggle, vim.tbl_extend("force", opts, { desc = "Strudel Toggle Play/Stop" }))
    map("n", "<leader>Zu", strudel.update, vim.tbl_extend("force", opts, { desc = "Strudel Update" }))
    map("n", "<leader>Zs", strudel.stop, vim.tbl_extend("force", opts, { desc = "Strudel Stop Playback" }))
    map("n", "<leader>Zb", strudel.set_buffer, vim.tbl_extend("force", opts, { desc = "Strudel Set Current Buffer" }))
    map("n", "<leader>Zx", strudel.execute, vim.tbl_extend("force", opts, { desc = "Strudel Set Buffer and Update" }))

    vim.api.nvim_create_user_command("StrudelBuild", function()
      strudel_nix.build(plugin.dir, { force = true, notify = true })
    end, { desc = "Reinstall strudel.nvim npm dependencies via Nix" })

    vim.api.nvim_create_user_command("StrudelHealth", function()
      strudel_nix.health(plugin.dir)
    end, { desc = "Check Strudel prerequisites (Nix, Chrome, npm deps)" })

    vim.api.nvim_create_user_command("StrudelCleanup", function()
      strudel_nix.cleanup_orphan_browser({ notify = true })
      vim.notify("Strudel: profile cleanup done", vim.log.levels.INFO)
    end, { desc = "Stop orphaned Strudel Chrome and clear profile locks" })
  end,
}
