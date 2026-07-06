-- Integrates Strudel live coding (strudel.cc) with Neovim via Puppeteer-driven Chrome.
-- Self-bootstraps on Nix machines: lazy.nvim build + async first-run npm install via strudel/shell.nix.
-- Depends on Nix (nodejs_22), Google Chrome at the default macOS path, and lazy.nvim.
-- Loaded eagerly (not lazy) so `.str` / `.std` filetype registration works (gruvw/strudel.nvim#5).
local strudel_nix = require("config.strudel-nix")

return {
  "gruvw/strudel.nvim",
  lazy = false,
  build = function(plugin)
    strudel_nix.build(plugin.dir, { notify = false })
  end,
  config = function(plugin)
    strudel_nix.bootstrap_async(plugin.dir)

    local strudel = require("strudel")

    strudel.setup({
      ui = {
        maximise_menu_panel = true,
      },
      start_on_launch = true,
      sync_cursor = true,
      report_eval_errors = true,
      browser_exec_path = strudel_nix.chrome_path(),
      browser_data_dir = strudel_nix.browser_data_dir(),
    })

    strudel_nix.setup_lifecycle(strudel)

    local launch = strudel_nix.wrap_launch(strudel, plugin.dir)
    local quit = strudel_nix.wrap_quit(strudel)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- `<leader>Z` avoids LazyVim's `<leader>s` search group; mirrors Kulala's `<leader>R` pattern.
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
