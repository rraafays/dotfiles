local home = os.getenv("HOME")
local jdtls = require("jdtls")

local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
	flags = {
		debounce_text_changes = 80,
	},
	on_attach = on_attach,
	root_dir = root_dir,
	settings = {
		java = {
			format = {
				settings = {
					url = home .. "/.config/nvim/etc/eclipse.xml",
					profile = "odyssey",
				},
			},
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/opt/homebrew/Cellar/openjdk@17/17.0.8.1",
					},
				},
			},
		},
	},
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",

		"-jar",
		vim.fn.glob("/opt/homebrew/Cellar/jdtls/1.28.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar"),

		"-configuration",
		"/opt/homebrew/Cellar/jdtls/1.28.0/libexec/config_mac",

		"-data",
		workspace_folder,
	},
}

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

jdtls.start_or_attach(config)
