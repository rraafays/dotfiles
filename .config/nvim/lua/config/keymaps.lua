local map = vim.keymap.set

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

map("n", "<F3>", ToggleSmartMark)
--
--
--
--
-- IntelliJ-style keymaps for LazyVim using Snacks

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local Snacks = require("snacks")
local dap = require("dap")

--------------------------------------------------
-- SEARCH / NAVIGATION
--------------------------------------------------

-- Double Shift equivalent → Search Everywhere
map("n", "<leader><leader>", Snacks.picker.smart, opts)

-- Cmd+Shift+O → Go to File
map("n", "<A-S-o>", Snacks.picker.files, opts)

-- Cmd+Shift+A → Find Action
map("n", "<A-S-a>", Snacks.picker.commands, opts)

-- Cmd+E → Recent Files
map("n", "<C-e>", Snacks.picker.recent, opts)

-- Cmd+Shift+E → Recent Locations
map("n", "<A-S-e>", Snacks.picker.jumps, opts)

-- Cmd+Alt+O → Go to Symbol
map("n", "<C-A-o>", Snacks.picker.lsp_symbols, opts)

-- Cmd+Alt+Shift+O → Workspace Symbols
map("n", "<C-A-S-o>", Snacks.picker.lsp_workspace_symbols, opts)

-- Cmd+Shift+F → Find in project
map("n", "<A-S-f>", Snacks.picker.grep, opts)

-- Cmd+F → Find in file
map("n", "<C-f>", "/", opts)

--------------------------------------------------
-- CODE NAVIGATION
--------------------------------------------------

-- Cmd+B → Go to definition
map("n", "<C-b>", vim.lsp.buf.definition, opts)

-- Cmd+Alt+B → Go to implementation
map("n", "<C-A-b>", vim.lsp.buf.implementation, opts)

-- Cmd+U → Type definition
map("n", "<C-u>", vim.lsp.buf.type_definition, opts)

-- Alt+F7 → Find usages
map("n", "<A-F7>", Snacks.picker.lsp_references, opts)

-- Cmd+Shift+I → Quick definition
map("n", "<A-S-i>", vim.lsp.buf.hover, opts)

--------------------------------------------------
-- REFACTORING
--------------------------------------------------

-- Ctrl+T → Refactor this
map("n", "<C-t>", vim.lsp.buf.code_action, opts)

-- Shift+F6 → Rename
map("n", "<S-F6>", vim.lsp.buf.rename, opts)

--------------------------------------------------
-- EDITING
--------------------------------------------------

-- Cmd+D → Duplicate line
map("n", "<C-d>", "yyp", opts)

-- Cmd+Delete → Delete line
map("n", "<C-BS>", "dd", opts)

-- Cmd+/ → Comment
map("n", "<C-/>", "gcc", { remap = true })
map("v", "<C-/>", "gc", { remap = true })

-- Cmd+Alt+L → Format
map("n", "<C-A-l>", function()
  vim.lsp.buf.format({ async = true })
end, opts)

--------------------------------------------------
-- TOOL WINDOWS
--------------------------------------------------

-- Cmd+1 → Project Explorer
map("n", "<A-1>", Snacks.picker.explorer, opts)

-- Cmd+7 → File Structure
map("n", "<A-7>", "<cmd>AerialToggle!<CR>", opts)

-- Cmd+6 → Problems
map("n", "<A-6>", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- Cmd+8 → TODOs
map("n", "<A-8>", "<cmd>TodoTrouble toggle<CR>", opts)

--------------------------------------------------
-- TERMINAL (Snacks)
--------------------------------------------------

-- Cmd+4 → Toggle terminal
map("n", "<A-4>", Snacks.terminal.toggle, opts)

-- Leader+tt → terminal
map("n", "<leader>tt", Snacks.terminal.toggle, opts)

--------------------------------------------------
-- TAB / BUFFER NAVIGATION
--------------------------------------------------

-- Cmd+Shift+[ → Previous file
map("n", "<A-S-[>", "<cmd>bprevious<CR>", opts)

-- Cmd+Shift+] → Next file
map("n", "<A-S-]>", "<cmd>bnext<CR>", opts)

-- Cmd+W → Close file
map("n", "<C-w>", "<cmd>bdelete<CR>", opts)

--------------------------------------------------
-- DEBUGGING
--------------------------------------------------

-- Cmd+F8 → Toggle breakpoint
map("n", "<C-F8>", dap.toggle_breakpoint, opts)

-- Shift+F8 → Step over
map("n", "<S-F8>", dap.step_over, opts)

-- F7 → Step into
map("n", "<F7>", dap.step_into, opts)

-- Shift+F7 → Step out
map("n", "<S-F7>", dap.step_out, opts)

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
