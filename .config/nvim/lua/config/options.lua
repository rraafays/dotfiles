-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.statusline = "%{repeat('─',winwidth('.'))}"
vim.opt.laststatus = 3
vim.wo.number = true
vim.opt.virtualedit = "block"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = false
vim.opt.showtabline = 0
vim.opt.cmdheight = 0
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true
vim.opt.fillchars = {
  horiz = " ",
  horizup = " ",
  horizdown = " ",
  vert = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
  eob = " ",
  fold = " ",
  foldsep = " ",
  foldopen = "+",
  foldclose = "-",
}

vim.o.guicursor = table.concat({
  "n-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
  "v-ve:block-VisualModeCursor/lVisualModeCursor-blinkwait1000-blinkon100-blinkoff100",
}, ",")
vim.cmd([[ set clipboard+=unnamedplus ]])
vim.cmd([[ syntax off ]])
