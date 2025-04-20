return {
  "stevearc/conform.nvim",
  opts = function()
    local formatter_config_dir = os.getenv("HOME") .. "/.config/etc/formatters/"

    local function get_formatters()
      if os.getenv("FORMAT") ~= "no" then
        return {
          lua = { "stylua" },
          sh = { "shfmt" },
          fish = { "fish_indent" },
          javascript = { "ram" },
          typescript = { "ram" },
          typescriptreact = { "ram" },
          xml = { "xmlformat" },
          sql = { "pgformatter" },
          java = { "aosp" },
          json = { "prettier" },
          html = { "prettier" },
          nix = { "nixfmt" },
          rust = { "rustfmt" },
        }
      else
        return {}
      end
    end

    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = get_formatters(),

      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        aosp = {
          command = "google-java-format",
          args = { "-", "--aosp" },
        },
        pgformatter = {
          command = "pg_format",
          stdin = true,
          args = { "-s", "4", "-u", "2", "--no-space-function" },
        },
        redgate = {
          command = "sql-formatter",
          stdin = true,
          args = {
            "--config",
            formatter_config_dir .. "redgate.json",
          },
        },
        ram = {
          command = "prettier",
          stdin = true,
          args = {
            "--tab-width",
            "4",
            "--print-width",
            "100",
            "--prose-wrap",
            "always",
            "--stdin-filepath",
            "$FILENAME",
          },
        },
        rustfmt = {
          command = "rustfmt",
          args = {
            "--config",
            "fn_single_line=true,where_single_line=true,tab_spaces=4,imports_layout=Vertical,hex_literal_case=Upper,max_width=80",
          },
        },
      },
    }
    return opts
  end,
  -- config = function()
  --   local conform = require("conform")
  --
  --   local slow_format_filetypes = { "java" }
  --
  --   conform.setup({
  --     formatters = {
  --     },
  --
  --     format_on_save = function(bufnr)
  --       if slow_format_filetypes[vim.bo[bufnr].filetype] then
  --         return
  --       end
  --       local function on_format(err)
  --         if err and err:match("timeout$") then
  --           slow_format_filetypes[vim.bo[bufnr].filetype] = true
  --         end
  --       end
  --
  --       return { timeout_ms = 1000, lsp_fallback = false }, on_format()
  --     end,
  --
  --     format_after_save = function(bufnr)
  --       if not slow_format_filetypes[vim.bo[bufnr].filetype] then
  --         return
  --       end
  --       return { lsp_fallback = false }
  --     end,
  --   })
  -- end,
}
