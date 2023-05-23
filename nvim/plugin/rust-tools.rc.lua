local status, rust_tools = pcall(require, 'rust-tools')
if (not status) then return end

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
    }
}
