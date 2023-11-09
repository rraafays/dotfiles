local home = os.getenv("HOME")
local jdtls = require("jdtls")

local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home
    .. "/.local/share/eclipse/"
    .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local function get_config()
    local config = home .. "/.local/share/nvim/mason/packages/jdtls/config_"
    if vim.loop.os_uname().sysname == "Darwin" then return config .. "mac" end
    if vim.loop.os_uname().sysname == "Linux" then return config .. "linux" end
end

local config = {
    flags = {
        debounce_text_changes = 80,
    },
    on_attach = vim.keymap.set(
        "n",
        "<C-o>",
        ':lua require("jdtls").organize_imports()<CR>'
    ),
    root_dir = root_dir,
    settings = {
        java = {
            format = { settings = { nil } },
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
        "-javaagent:"
            .. home
            .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",

        "-jar",
        vim.fn.glob(
            home
                .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
        ),

        "-configuration",
        get_config(),

        "-data",
        workspace_folder,
    },
}

jdtls.start_or_attach(config)
