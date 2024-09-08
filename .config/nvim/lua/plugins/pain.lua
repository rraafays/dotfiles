return {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    config = function()
        DOCUMENT_WIDTH = 60
        RECEIPT_WIDTH = 40

        require("no-neck-pain").setup({
            debug = false,
            width = DOCUMENT_WIDTH,
            minSideBufferWidth = 0,
            disableOnLastBuffer = false,
            killAllBuffersOnDisable = false,
            autocmds = {
                enableOnVimEnter = true,
                enableOnTabEnter = false,
                reloadOnColorSchemeChange = false,
            },
            mappings = {
                enabled = true,
                widthUp = "=",
                widthDown = "-",
                scratchPad = "false",
            },
        })

        vim.api.nvim_create_user_command("Center", function()
            local filetype = vim.bo.filetype
            if
                filetype == "TelescopePrompt"
                or filetype == "alpha"
                or filetype == "lazy"
                or filetype == "chatgpt-input"
            then
                return
            end
            vim.cmd("w! ~/.cache/nvim/width")
            local command = io.popen("wc -L " .. "~/.cache/nvim/width")
            if command ~= nil then
                local result = command:read("*a")
                for i in string.gmatch(result, "%S+") do
                    if tonumber(i) ~= nil then
                        vim.cmd("NoNeckPainResize " .. i + 2)
                    end
                end
            end
        end, {})

        vim.api.nvim_create_user_command("Square", function()
            local command = io.popen("tput lines")
            if command ~= nil then
                local result = command:read("*a")
                vim.cmd("NoNeckPainResize " .. result * 2)
            end
        end, {})

        vim.api.nvim_create_autocmd("CursorMovedI", {
            pattern = "",
            command = "Center",
        })

        vim.api.nvim_create_autocmd("TextChanged", {
            pattern = "",
            command = "Center",
        })

        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "",
            command = "Center",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "man",
            command = "Square",
        })
    end,
}
