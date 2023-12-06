local pain = require("no-neck-pain")
DEFAULT_WIDTH = 80

pain.setup({
    debug = false,
    width = DEFAULT_WIDTH,
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
    if vim.bo.filetype == "xxd" or vim.bo.filetype == "alpha" then
        vim.cmd("NoNeckPainResize " .. DEFAULT_WIDTH)
        return
    end
    local command = io.popen(
        "wc -L " .. vim.fn.expand("%:p") .. " | tr -s ' ' | cut -d ' ' -f 2"
    )
    if command ~= nil then
        local width = command:read("*a")
        vim.cmd("NoNeckPainResize " .. width + 2)
    end
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "",
    command = "Center",
})
