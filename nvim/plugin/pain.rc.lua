local pain = require("no-neck-pain")

DOCUMENT_WIDTH = 80
RECEIPT_WIDTH = 60

pain.setup({
    debug = false,
    width = DOCUMENT_WIDTH,
    minSideBufferWidth = 0,
    disableOnLastBuffer = true,
    killAllBuffersOnDisable = true,
    autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
    },
    mappings = {
        enabled = true,
        toggle = "z",
        widthUp = "=",
        widthDown = "-",
        scratchPad = "false",
    },
})

vim.api.nvim_create_user_command("Center", function()
    local filetype = vim.bo.filetype
    if filetype == "xxd" or filetype == "alpha" then
        vim.cmd("NoNeckPainResize " .. DOCUMENT_WIDTH)
        return
    elseif filetype == "text" then
        vim.cmd("NoNeckPainResize " .. RECEIPT_WIDTH)
        return
    end
    local command = io.popen("wc -L " .. vim.fn.expand("%:p"))
    if command ~= nil then
        local result = command:read("*a")
        for i in string.gmatch(result, "%S+") do
            if tonumber(i) ~= nil then vim.cmd("NoNeckPainResize " .. i + 2) end
        end
    end
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "",
    command = "Center",
})
