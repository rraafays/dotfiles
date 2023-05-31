local status, gruvbox = pcall(require, 'gruvbox')
if (not status) then return end

gruvbox.setup({
    italic = { strings = false, operators = false, comments = false },
    invert_selection = true,
    palette_overrides = {
        dark0 = "#000000",
        dark1 = "#000000",
        dark2 = "#000000"
    }
})

vim.cmd [[ colorscheme gruvbox ]]
