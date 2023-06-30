local lspkind = require("lspkind");

local function get_symbols()
    if os.getenv("DISPLAY") == nil then
        return {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }
    else
        return {
            Text = "",
            Method = "",
            Function = "󰊕",
            Constructor = "",
            Field = "",
            Variable = "󰀫",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "󰎠",
            Enum = "󱃠",
            Keyword = "",
            Snippet = "󰅴",
            Color = "",
            File = "",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "󱃠",
            Constant = "",
            Struct = "",
            Event = "󱐋",
            Operator = "",
            TypeParameter = ""
        }
    end
end

lspkind.init {
    preset = 'codicons',
    symbol_map = get_symbols()
}
