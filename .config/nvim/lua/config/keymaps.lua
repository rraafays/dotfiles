function ToggleSmartMark()
  local bufnr = vim.api.nvim_get_current_buf()
  local curr_line = vim.api.nvim_win_get_cursor(0)[1]
  local marks = vim.fn.getmarklist(bufnr)
  local used = {}
  local mark_on_line = nil

  for _, mark in ipairs(marks) do
    local name = mark.mark:sub(2, 2)
    local line = mark.pos[2]
    if name:match("[a-z]") then
      used[name] = true
      if line == curr_line then
        mark_on_line = name
      end
    end
  end

  if mark_on_line then
    vim.cmd("delmarks " .. mark_on_line)
    vim.cmd("redraw!")
    return
  end

  for c = string.byte("a"), string.byte("z") do
    local letter = string.char(c)
    if not used[letter] then
      vim.cmd("normal! m" .. letter)
      vim.cmd("redraw!")
      return
    end
  end

  print("No free marks available!")
end

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local Snacks = require("snacks")
local dap = require("dap")

--------------------------------------------------
-- SEARCH / NAVIGATION
--------------------------------------------------

-- spc,spc -> search everything
map("n", "<leader><leader>", Snacks.picker.smart, opts)

-- Ctrl+Shift+N → Go to File
map("n", "<C-S-n>", Snacks.picker.files, opts)

-- Ctrl+Shift+A → Find Action
map("n", "<C-S-a>", Snacks.picker.commands, opts)

-- Ctrl+E → Recent Files
map("n", "<C-e>", Snacks.picker.recent, opts)

-- Ctrl+Shift+E → Recent Locations
map("n", "<C-S-e>", Snacks.picker.jumps, opts)

-- Ctrl+Alt+Shift+N → Go to Symbol
map("n", "<C-A-S-n>", Snacks.picker.lsp_symbols, opts)

-- Ctrl+Alt+Shift+N → Workspace Symbols
map("n", "<C-A-S-n>", Snacks.picker.lsp_workspace_symbols, opts)

-- Ctrl+Shift+F → Find in project
map("n", "<C-S-f>", Snacks.picker.grep, opts)

-- Ctrl+F → Find in file
map("n", "<C-f>", "/", opts)

--------------------------------------------------
-- CODE NAVIGATION
--------------------------------------------------

-- Ctrl+B → Go to definition
map("n", "<C-b>", vim.lsp.buf.definition, opts)

-- Ctrl+Alt+B → Go to implementation
map("n", "<C-A-b>", vim.lsp.buf.implementation, opts)

-- Ctrl+Shift+B → Type definition
map("n", "<C-S-b>", vim.lsp.buf.type_definition, opts)

-- Alt+F7 → Find usages
map("n", "<A-F7>", Snacks.picker.lsp_references, opts)

-- Ctrl+Shift+I → Quick definition
map("n", "<C-S-i>", vim.lsp.buf.hover, opts)

-- f3 -> place mark
map("n", "<F3>", ToggleSmartMark)

--------------------------------------------------
-- REFACTORING
--------------------------------------------------

-- Ctrl+Alt+Shift+T → Refactor this
map("n", "<C-A-S-t>", vim.lsp.buf.code_action, opts)

-- Shift+F6 → Rename
map("n", "<S-F6>", vim.lsp.buf.rename, opts)

--------------------------------------------------
-- EDITING
--------------------------------------------------

-- Ctrl+D → Duplicate line
map("n", "<C-d>", "yyp", opts)

-- Ctrl+Y → Delete line
map("n", "<C-y>", "dd", opts)

-- Ctrl+/ → Comment
map("n", "<C-/>", "gcc", { remap = true })
map("v", "<C-/>", "gc", { remap = true })

-- Ctrl+Alt+L → Format
map("n", "<C-A-l>", function()
  vim.lsp.buf.format({ async = true })
end, opts)

--------------------------------------------------
-- TOOL WINDOWS
--------------------------------------------------

-- Alt+1 → Project Explorer
map("n", "<A-1>", Snacks.picker.explorer, opts)

-- Alt+7 → File Structure
map("n", "<A-7>", "<cmd>AerialToggle!<CR>", opts)

-- Alt+6 → Problems
map("n", "<A-6>", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- Alt+8 → TODOs
map("n", "<A-8>", "<cmd>TodoTrouble toggle<CR>", opts)

--------------------------------------------------
-- TERMINAL (Snacks)
--------------------------------------------------

-- Alt+4 → Toggle terminal
map("n", "<A-4>", Snacks.terminal.toggle, opts)
map("t", "<A-4>", Snacks.terminal.toggle, opts)

-- Leader+tt → terminal
map("n", "<leader>tt", Snacks.terminal.toggle, opts)

--------------------------------------------------
-- TAB / BUFFER NAVIGATION
--------------------------------------------------

-- Alt+Left → Previous file (mapped to Ctrl+Tab equivalent)
map("n", "<A-Left>", "<cmd>bprevious<CR>", opts)

-- Alt+Right → Next file (mapped to Ctrl+Shift+Tab equivalent)
map("n", "<A-Right>", "<cmd>bnext<CR>", opts)

-- Ctrl+F4 → Close file
map("n", "<C-F4>", "<cmd>bdelete<CR>", opts)

--------------------------------------------------
-- DEBUGGING
--------------------------------------------------

-- Ctrl+F8 → Toggle breakpoint
map("n", "<C-F8>", dap.toggle_breakpoint, opts)

-- F8 → Step over
map("n", "<F8>", dap.step_over, opts)

-- F7 → Step into
map("n", "<F7>", dap.step_into, opts)

-- Shift+F8 → Step out
map("n", "<S-F8>", dap.step_out, opts)

-- Shift+F9 → Debug
map("n", "<S-F9>", dap.continue, opts)

-- Shift+F10 → Run
map("n", "<S-F10>", dap.run_last, opts)

--------------------------------------------------
-- DIAGNOSTICS
--------------------------------------------------

-- F2 → Next error
map("n", "<F2>", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- Shift+F2 → Previous error
map("n", "<S-F2>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
