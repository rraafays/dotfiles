return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        local function get_os()
            return vim.loop.os_uname().sysname
        end
        local formatter_config_dir = os.getenv("HOME") .. "/.config/etc/formatters/"

        local function get_idea_bin()
            if get_os() == "Darwin" then
                return "idea"
            end
            if get_os() == "Linux" then
                return "idea-community"
            end
        end

        local slow_format_filetypes = { "java" }
        local function get_formatters()
            if os.getenv("FORMAT") ~= "no" then
                return {
                    lua = { "stylua" },
                    sh = { "shfmt" },
                    fish = { "fish_indent" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    xml = { "xmlformat" },
                    sql = { "redgate" },
                    java = { "intellij" },
                    json = { "prettier" },
                    html = { "prettier" },
                    nix = { "nixfmt" },
                    rust = { "rustfmt" },
                }
            else
                return {}
            end
        end

        conform.setup({
            formatters_by_ft = get_formatters(),
            formatters = {
                intellij = {
                    command = get_idea_bin(),
                    require_cwd = false,
                    stdin = false,
                    args = {
                        "format",
                        "-s",
                        formatter_config_dir .. "intellij.xml",
                        "$FILENAME",
                    },
                },
                redgate = {
                    command = "sql-formatter",
                    stdin = true,
                    args = {
                        "--config",
                        formatter_config_dir .. "redgate.json",
                    },
                },
                cognitran = {
                    command = "prettier",
                    stdin = true,
                    args = {
                        "--trailing-comma",
                        "es5",
                        "--tab-width",
                        2,
                        "--print-width",
                        100,
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

            format_on_save = function(bufnr)
                if slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                local function on_format(err)
                    if err and err:match("timeout$") then
                        slow_format_filetypes[vim.bo[bufnr].filetype] = true
                    end
                end

                return { timeout_ms = 1000, lsp_fallback = false }, on_format
            end,

            format_after_save = function(bufnr)
                if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                return { lsp_fallback = false }
            end,
        })
    end,
}
