local ufo = require("ufo")

vim.o.foldcolumn = "0"
vim.o.foldlevel = 198
vim.o.foldlevelstart = 198
vim.o.foldenable = true

vim.keymap.set("n", "<Return>", "za")
vim.keymap.set("n", "<S-Return>", "zM")

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" < %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
	fold_virt_text_handler = handler,
})