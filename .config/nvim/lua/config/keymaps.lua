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

--================================================
-- macOS IntelliJ KEYBINDINGS
-- Reference: https://resources.jetbrains.com/help/img/idea/KeymapReference_Mac.pdf
--================================================

--================================================
-- SEARCH / NAVIGATION / GLOBAL
--================================================

-- Cmd+Shift+A → Find Action
map("n", "<D-S-a>", Snacks.picker.commands, opts)

-- Cmd+1 → Project panel
map("n", "<D-1>", Snacks.picker.explorer, opts)

-- Cmd+2 → Bookmarks panel
-- map("n", "<D-2>", ..., opts)  -- NOTE: requires bookmarks plugin

-- Cmd+3 → Find Results panel
-- map("n", "<D-3>", ..., opts)  -- NOTE: requires search history plugin

-- Cmd+4 → Run panel
-- map("n", "<D-4>", Snacks.terminal.toggle, opts)

-- Cmd+5 → Debug panel
-- map("n", "<D-5>", ..., opts)  -- NOTE: requires dap UI plugin (nvim-dap-ui)

-- Cmd+6 → Problems/Diagnostics panel
map("n", "<D-6>", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- Cmd+7 → Structure panel
map("n", "<D-7>", "<cmd>AerialToggle!<CR>", opts)

-- Cmd+8 → Services panel
-- map("n", "<D-8>", ..., opts)  -- NOTE: unavailable in Neovim

-- Cmd+9 → Git/Version Control panel
-- map("n", "<D-9>", ..., opts)  -- NOTE: requires git integration plugin

-- Cmd+0 → Message panel
-- map("n", "<D-0>", ..., opts)  -- NOTE: requires message history plugin

--================================================
-- SEARCHING & FINDING
--================================================

-- Cmd+F → Find
map("n", "<D-f>", "/", opts)
map("v", "<D-f>", "/", opts)

-- Cmd+G → Find Next
map("n", "<D-g>", "n", opts)

-- Cmd+Shift+G → Find Previous
map("n", "<D-S-g>", "N", opts)

-- Cmd+H → Replace
-- map("n", "<D-h>", ..., opts)  -- NOTE: requires advanced search/replace (grug-far.nvim available)
map("n", "<D-h>", Snacks.picker.grep, opts)

-- Cmd+Shift+F → Find in Files/Project
map("n", "<D-S-f>", Snacks.picker.grep, opts)

-- Cmd+Shift+H → Replace in Files
-- map("n", "<D-S-h>", ..., opts)  -- NOTE: requires grug-far.nvim setup for replace

-- Cmd+O → Go to Class
map("n", "<D-o>", Snacks.picker.lsp_symbols, opts)

-- Cmd+Shift+O → Go to Symbol
map("n", "<D-S-o>", Snacks.picker.lsp_workspace_symbols, opts)

-- Cmd+Alt+O → Go to Symbol in File
map("n", "<D-A-o>", Snacks.picker.lsp_symbols, opts)

-- Ctrl+Shift+A → Go to File
map("n", "<C-S-a>", Snacks.picker.files, opts)

-- Cmd+; → Search everywhere
map("n", "<D-;>", Snacks.picker.smart, opts)

--================================================
-- CODE NAVIGATION
--================================================

-- Cmd+B → Go to Declaration/Definition
map("n", "<D-b>", vim.lsp.buf.definition, opts)

-- Cmd+Alt+B → Go to Implementation
map("n", "<D-A-b>", vim.lsp.buf.implementation, opts)

-- Cmd+Y → Show Quick Definition
map("n", "<D-y>", vim.lsp.buf.hover, opts)

-- Cmd+Ctrl+B → Open in New Window (Declaration)
-- map("n", "<D-C-b>", ..., opts)  -- NOTE: requires window management plugin

-- Cmd+[ → Back
map("n", "<D-[>", "<C-o>", opts)

-- Cmd+] → Forward
map("n", "<D-]>", "<C-i>", opts)

-- Cmd+Ctrl+H → Type Hierarchy
-- map("n", "<D-C-h>", ..., opts)  -- NOTE: requires hierarchy plugin (aerial.nvim shows structure)

-- Cmd+Ctrl+U → Show UML Diagram
-- map("n", "<D-C-u>", ..., opts)  -- NOTE: unavailable in Neovim

-- F12 → Go to declaration
map("n", "<F12>", vim.lsp.buf.definition, opts)

-- Ctrl+Alt+G → Find usages / Go to references
map("n", "<C-A-g>", Snacks.picker.lsp_references, opts)

-- Cmd+Alt+J → Collapse/Inline
-- map("n", "<D-A-j>", ..., opts)  -- NOTE: requires code folding UI

--================================================
-- EDITING & TEXT MANIPULATION
--================================================

-- Cmd+X → Cut line
map("n", "<D-x>", "dd", opts)

-- Cmd+C → Copy line (with vim select)
map("n", "<D-c>", "yy", opts)

-- Cmd+V → Paste
map("n", "<D-v>", "p", opts)

-- Cmd+D → Duplicate line
map("n", "<D-d>", "yyp", opts)

-- Cmd+Delete → Delete line
map("n", "<D-Backspace>", "dd", opts)

-- Ctrl+Shift+J → Join lines
map("n", "<C-S-j>", "J", opts)

-- Cmd+Alt+L → Reformat code
map("n", "<D-A-l>", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Cmd+Alt+I → Auto-indent lines
map("n", "<D-A-i>", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Cmd+/ → Comment line
map("n", "<D-/>", "gcc", { remap = true })
map("v", "<D-/>", "gc", { remap = true })

-- Cmd+Alt+/ → Block comment
map("n", "<D-A-/>", "gbc", { remap = true })
map("v", "<D-A-/>", "gb", { remap = true })

-- Cmd+Shift+Enter → Complete Statement
-- map("n", "<D-S-CR>", ..., opts)  -- NOTE: requires smart completion

-- Cmd+Alt+T → Surround with...
-- map("n", "<D-A-t>", ..., opts)  -- NOTE: requires vim-surround or mini.surround

-- Cmd+Shift+Delete → Delete to word start
map("n", "<D-S-Backspace>", "dB", opts)

-- Cmd+Alt+Shift+Delete → Delete to word end
map("n", "<D-A-S-Backspace>", "dE", opts)

-- Ctrl+H → Show Signature Help
map("n", "<C-h>", vim.lsp.buf.signature_help, opts)

--================================================
-- REFACTORING & CODE ACTIONS
--================================================

-- Cmd+Alt+R → Refactor This
map("n", "<D-A-r>", vim.lsp.buf.code_action, opts)

-- Cmd+Alt+M → Extract Method
-- map("n", "<D-A-m>", ..., opts)  -- NOTE: requires nvim-refactoring plugin

-- Cmd+Alt+V → Extract Variable
-- map("n", "<D-A-v>", ..., opts)  -- NOTE: requires nvim-refactoring plugin

-- Cmd+Alt+C → Extract Constant
-- map("n", "<D-A-c>", ..., opts)  -- NOTE: requires nvim-refactoring plugin

-- Cmd+Alt+P → Extract Parameter
-- map("n", "<D-A-p>", ..., opts)  -- NOTE: requires nvim-refactoring plugin

-- F6 → Rename
map("n", "<F6>", vim.lsp.buf.rename, opts)

-- Cmd+Alt+Shift+M → Move
-- map("n", "<D-A-S-m>", ..., opts)  -- NOTE: requires file movement plugin

-- Cmd+Alt+N → Inline
-- map("n", "<D-A-n>", ..., opts)  -- NOTE: requires code analysis plugin

--================================================
-- TOOL WINDOWS & PANELS
--================================================

-- Cmd+W → Close tab/window
map("n", "<D-w>", "<cmd>bdelete<CR>", opts)

-- Cmd+Alt+Y → Sync
-- map("n", "<D-A-y>", ..., opts)  -- NOTE: requires VCS plugin

-- Cmd+Alt+Shift+Y → Force Refresh
-- map("n", "<D-A-S-y>", ..., opts)  -- NOTE: requires VCS plugin

-- Cmd+T → Recent Files
map("n", "<D-t>", Snacks.picker.recent, opts)

-- Cmd+Ctrl+E → Recent Locations
map("n", "<D-C-e>", Snacks.picker.jumps, opts)

-- Cmd+Alt+S → Settings/Preferences
-- map("n", "<D-A-s>", ..., opts)  -- NOTE: open neovim config manually

-- Cmd+, → IDE Settings
-- map("n", "<D-,>", ..., opts)  -- NOTE: open neovim config manually

--================================================
-- TAB / BUFFER NAVIGATION
--================================================

-- Cmd+[ → Previous tab/buffer
map("n", "<D-[>", "<cmd>bprevious<CR>", opts)

-- Cmd+] → Next tab/buffer
map("n", "<D-]>", "<cmd>bnext<CR>", opts)

-- Cmd+Shift+[ → Move tab left
-- map("n", "<D-S-[>", ..., opts)  -- NOTE: requires bufferline configuration

-- Cmd+Shift+] → Move tab right
-- map("n", "<D-S-]>", ..., opts)  -- NOTE: requires bufferline configuration

-- Cmd+Alt+Left → Previous editor/file
map("n", "<D-A-Left>", "<cmd>bprevious<CR>", opts)

-- Cmd+Alt+Right → Next editor/file
map("n", "<D-A-Right>", "<cmd>bnext<CR>", opts)

-- Cmd+L → Go to Line
map("n", "<D-l>", "<cmd>lua require('snacks').picker.lines()<CR>", opts)

--================================================
-- RUNNING & DEBUGGING
--================================================

-- Ctrl+R → Run
-- map("n", "<C-r>", dap.run_last, opts)  -- NOTE: requires dap configuration

-- Ctrl+D → Debug
-- map("n", "<C-d>", dap.continue, opts)  -- NOTE: requires dap configuration

-- Ctrl+Shift+R → Run with options
-- map("n", "<C-S-r>", ..., opts)  -- NOTE: requires dap UI

-- Ctrl+Shift+D → Debug with options
-- map("n", "<C-S-d>", ..., opts)  -- NOTE: requires dap UI

-- Cmd+Alt+R → Debug (alternative)
map("n", "<D-A-d>", dap.continue, opts)

-- F9 → Resume/Continue
map("n", "<F9>", dap.continue, opts)

-- Cmd+Shift+F10 → Run from editor
-- map("n", "<D-S-F10>", dap.run_last, opts)  -- NOTE: platform-specific

-- Cmd+Shift+F9 → Debug from editor
-- map("n", "<D-S-F9>", dap.continue, opts)  -- NOTE: platform-specific

--================================================
-- BREAKPOINTS & STEPPING
--================================================

-- Cmd+F8 → Toggle breakpoint
map("n", "<D-F8>", dap.toggle_breakpoint, opts)

-- Cmd+Shift+F8 → View breakpoints
-- map("n", "<D-S-F8>", ..., opts)  -- NOTE: requires dap UI (nvim-dap-ui)

-- F10 → Step over
map("n", "<F10>", dap.step_over, opts)

-- F11 → Step into
map("n", "<F11>", dap.step_into, opts)

-- Cmd+Shift+F11 → Step into by type
-- map("n", "<D-S-F11>", ..., opts)  -- NOTE: requires advanced dap

-- Cmd+F11 → Force step into
-- map("n", "<D-F11>", dap.step_into, opts)

-- Cmd+Shift+F10 → Step out
map("n", "<D-S-F10>", dap.step_out, opts)

-- Cmd+Alt+F9 → Run to cursor
-- map("n", "<D-A-F9>", dap.run_to_cursor, opts)

-- Cmd+Alt+F10 → Force run to cursor
-- map("n", "<D-A-F10>", ..., opts)  -- NOTE: requires dap extension

--================================================
-- DIAGNOSTICS & INSPECTIONS
--================================================

-- F2 → Next error/problem
map("n", "<F2>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Shift+F2 → Previous error/problem
map("n", "<S-F2>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- Cmd+Alt+Shift+I → Run inspections
-- map("n", "<D-A-S-i>", ..., opts)  -- NOTE: requires code inspection plugin

-- Cmd+Alt+I → Show intention actions
map("n", "<D-A-i>", vim.lsp.buf.code_action, opts)

--================================================
-- BOOKMARKS & MARKS
--================================================

-- F3 → Toggle bookmark / Smart Mark
map("n", "<F3>", ToggleSmartMark, opts)

-- Cmd+F3 → Toggle bookmark with mnemonic
-- map("n", "<D-F3>", ..., opts)  -- NOTE: requires bookmark plugin

-- Cmd+2 → Show bookmarks
-- map("n", "<D-2>", ..., opts)  -- NOTE: requires bookmark plugin

-- Cmd+Shift+1 to Cmd+Shift+9 → Set bookmark 1-9
-- map("n", "<D-S-1>", ..., opts)  -- NOTE: requires bookmark plugin

-- Cmd+1 to Cmd+9 → Go to bookmark 1-9
-- map("n", "<D-1>", ..., opts)  -- NOTE: requires bookmark plugin

--================================================
-- VERSION CONTROL / GIT
--================================================

-- Cmd+K → Commit
-- map("n", "<D-k>", ..., opts)  -- NOTE: requires git/fugitive plugin

-- Cmd+Shift+K → Push
-- map("n", "<D-S-k>", ..., opts)  -- NOTE: requires git plugin

-- Cmd+Ctrl+Alt+Z → Rollback
-- map("n", "<D-C-A-z>", ..., opts)  -- NOTE: requires git plugin

-- Cmd+' → VCS operations menu
-- map("n", "<D-'>", ..., opts)  -- NOTE: requires git plugin

-- Cmd+Alt+G → Show diff
-- map("n", "<D-A-g>", ..., opts)  -- NOTE: use gitsigns instead

--================================================
-- TERMINAL
--================================================

-- Ctrl+` → Toggle terminal
map("n", "<C-`>", Snacks.terminal.toggle, opts)
map("t", "<C-`>", Snacks.terminal.toggle, opts)

-- Alt+F12 → Toggle terminal (alternative)
map("n", "<A-F12>", Snacks.terminal.toggle, opts)
map("t", "<A-F12>", Snacks.terminal.toggle, opts)

--================================================
-- SELECTION & MULTI-CURSOR
--================================================

-- Ctrl+G → Add next occurrence to selection (multi-cursor)
-- map("n", "<C-g>", ..., opts)  -- NOTE: requires vim-visual-multi or similar

-- Ctrl+Cmd+G → Add all occurrences to selection
-- map("n", "<C-D-g>", ..., opts)  -- NOTE: requires vim-visual-multi or similar

-- Cmd+Alt+Shift+J → Create rectangular selection
-- map("n", "<D-A-S-j>", ..., opts)  -- NOTE: requires column selection plugin

-- Cmd+Shift+L → Split selection into lines
-- map("n", "<D-S-l>", ..., opts)  -- NOTE: requires advanced selection plugin

-- Alt+Click → Column selection
-- NOTE: Mouse-based, handled by terminal

--================================================
-- OTHER ACTIONS
--================================================

-- Cmd+N → Generate (new file, class, etc.)
-- map("n", "<D-n>", ..., opts)  -- NOTE: requires generation plugin

-- Cmd+Alt+O → Optimize imports
-- map("n", "<D-A-o>", ..., opts)  -- NOTE: requires LSP-based import plugin

-- Cmd+Shift+M → Mark as modified
-- map("n", "<D-S-m>", ..., opts)  -- NOTE: built-in buffer modification tracking

-- Cmd+Ctrl+S → Save all
map("n", "<D-C-s>", "<cmd>wa<CR>", opts)

-- Cmd+S → Save
map("n", "<D-s>", "<cmd>w<CR>", opts)

-- Cmd+Z → Undo
map("n", "<D-z>", "u", opts)

-- Cmd+Shift+Z → Redo
map("n", "<D-S-z>", "<C-r>", opts)
