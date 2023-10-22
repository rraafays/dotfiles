local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Tab>"] = cmp.mapping.scroll_docs(4),
		["<C-S-Tab>"] = cmp.mapping.scroll_docs(-4),
		["<Esc>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = {
		{ name = "path" },
		{ name = "crates" },
		{
			name = "buffer",
			entry_filter = function(entry, ctx)
				return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",

			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	window = {
		completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
		documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
	},
})

vim.cmd([[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]])
