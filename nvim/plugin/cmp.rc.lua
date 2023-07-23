local cmp = require("cmp")
local lspkind = require("lspkind")

local function get_window_border()
	if os.getenv("DISPLAY") == nil then
		return {
			completion = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
			documentation = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
		}
	else
		return {
			completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
			documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
		}
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<A-Tab>"] = cmp.mapping.scroll_docs(4),
		["<A-S-Tab>"] = cmp.mapping.scroll_docs(-4),
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
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	window = get_window_border(),
})

vim.cmd([[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]])
