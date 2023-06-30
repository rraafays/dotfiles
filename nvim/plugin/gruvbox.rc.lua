local gruvbox = require("gruvbox")

gruvbox.setup{
    italic = { strings = false, operators = false, comments = false },
    invert_selection = true,
    palette_overrides = {
        dark0 = "#000000",
        dark1 = "#000000",
        dark2 = "#000000"
    }
}

if os.getenv("DISPLAY") == nil then
    vim.cmd [[ colorscheme habamax ]]
else
    vim.cmd [[ colorscheme gruvbox ]]
end
