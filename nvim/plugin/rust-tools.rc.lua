local rust_tools = require("rust-tools")

rust_tools.setup {
	server = {
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
    }
}
