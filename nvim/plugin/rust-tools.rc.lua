local rust_tools = require("rust-tools")

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extensions_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extensions_path .. "adapter/codelldb"
local liblldb_path = extensions_path .. "lldb/lib/liblldb.dylib"

rust_tools.setup {
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    },
	server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "?", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
			["rust-analyzer"] = {
				-- -- enable clippy on save
				-- checkOnSave = {
				-- 	command = "clippy",
				-- 	extraArgs = { "--all", "--", "-W", "clippy::all" },
				-- },
                diagnostics = {
                    disabled = { "unresolved-proc-macro" }
                },
				rustfmt = {
					extraArgs = { "+nightly" },
				},
				cargo = {
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    },
    tools = {
        hover_actions = {
            auto_focus = true
        }
    }
}
