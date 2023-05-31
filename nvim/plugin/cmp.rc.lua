local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<A-Tab>'] = cmp.mapping.scroll_docs(4),
        ['<A-S-Tab>'] = cmp.mapping.scroll_docs(-4),
        ['<Esc>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
        }),
    }),
    sources = {
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "crates" }
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
    },
    window = {
        completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
        documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
    }
})

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
