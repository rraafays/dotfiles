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
-- macOS For All IntelliJ KEYBINDINGS (Ctrl-based)
-- Reference: /Users/raf/Development/hhkb-intellij/src/main/resources/keymaps/macOS For All.xml
-- No Command key usage - uses Control (Ctrl+), Alt, and Shift combinations
--================================================

--================================================
-- TOOL WINDOWS & PANELS
--================================================

-- Alt+1 → Project Explorer / Project Tool Window
map("n", "<A-1>", Snacks.picker.explorer, opts)

-- Alt+2 → Bookmarks Tool Window
-- map("n", "<A-2>", ..., opts)  -- NOTE: requires bookmarks plugin

-- Alt+3 → Find Tool Window
-- map("n", "<A-3>", ..., opts)  -- NOTE: requires search history plugin

-- Alt+4 → Run Tool Window / Terminal
map("n", "<A-4>", Snacks.terminal.toggle, opts)
map("t", "<A-4>", Snacks.terminal.toggle, opts)

-- Alt+5 → Debug Tool Window
-- map("n", "<A-5>", ..., opts)  -- NOTE: requires dap UI plugin (nvim-dap-ui)

-- Alt+6 → Problems View / Diagnostics
map("n", "<A-6>", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- Alt+7 → Structure Tool Window / File Structure
map("n", "<A-7>", "<cmd>AerialToggle!<CR>", opts)

-- Alt+8 → Services Tool Window
-- map("n", "<A-8>", ..., opts)  -- NOTE: unavailable in Neovim

-- Alt+9 → Version Control / Git Tool Window
-- map("n", "<A-9>", ..., opts)  -- NOTE: requires git integration plugin

-- Alt+0 → Commit Tool Window
-- map("n", "<A-0>", ..., opts)  -- NOTE: requires git integration plugin

--================================================
-- SEARCHING & FINDING
--================================================

-- Ctrl+F → Find in file
map("n", "<C-f>", "/", opts)
map("v", "<C-f>", "/", opts)

-- Ctrl+Shift+F → Find in Path / Find in project
map("n", "<C-S-f>", Snacks.picker.grep, opts)

-- Ctrl+G → Find Next
map("n", "<C-g>", "n", opts)

-- Alt+Shift+G → Find Previous
map("n", "<A-S-g>", "N", opts)

-- Ctrl+Shift+R → Replace in Path
-- map("n", "<C-S-r>", ..., opts)  -- NOTE: requires grug-far.nvim setup for replace

-- Ctrl+O → Go to Class
map("n", "<C-o>", Snacks.picker.lsp_symbols, opts)

-- Ctrl+Shift+O → Go to File
map("n", "<C-S-o>", Snacks.picker.files, opts)

-- Ctrl+Alt+O → Go to Symbol
map("n", "<C-A-o>", Snacks.picker.lsp_workspace_symbols, opts)

-- Ctrl+L → Go to Line
map("n", "<C-l>", "<cmd>lua require('snacks').picker.lines()<CR>", opts)

-- Ctrl+Alt+Home → Go to Related
-- map("n", "<C-A-Home>", ..., opts)  -- NOTE: requires file relation navigation

-- Ctrl+P → File Chooser Toggle Path Bar
map("n", "<C-p>", Snacks.picker.recent, opts)

--================================================
-- CODE NAVIGATION & REFERENCES
--================================================

-- Ctrl+B → Go to Declaration / Go to Definition
map("n", "<C-b>", vim.lsp.buf.definition, opts)

-- Ctrl+Shift+B → Go to Type Declaration
-- map("n", "<C-S-b>", vim.lsp.buf.type_definition, opts)

-- Ctrl+Alt+G → Find usages / Go to References
map("n", "<C-A-g>", Snacks.picker.lsp_references, opts)

-- Ctrl+Alt+H → Call Hierarchy
-- map("n", "<C-A-h>", ..., opts)  -- NOTE: requires hierarchy plugin

-- Ctrl+H → Type Hierarchy
-- map("n", "<C-h>", ..., opts)  -- NOTE: requires hierarchy plugin (aerial.nvim shows structure)

-- Ctrl+Y → Quick Implementations / Quick Definition
map("n", "<C-y>", vim.lsp.buf.hover, opts)

-- Ctrl+Alt+Left → Back (Previous location)
map("n", "<C-A-Left>", "<C-o>", opts)
map("n", "<C-[>", "<C-o>", opts)

-- Ctrl+Alt+Right → Forward (Next location)
map("n", "<C-A-Right>", "<C-i>", opts)
map("n", "<C-]>", "<C-i>", opts)

-- F4 → Edit Source
map("n", "<F4>", "<cmd>vsplit<CR>", opts)

-- Ctrl+Down → Edit Source / Go into definition
map("n", "<C-Down>", vim.lsp.buf.definition, opts)

--================================================
-- EDITING & TEXT MANIPULATION
--================================================

-- Ctrl+D → EditorDeleteLine (but vim-like delete, we use Ctrl+B for backspace line)
-- Using native behavior: Ctrl+D scrolls down (vim default)
-- For delete line use: Ctrl+K (EditorCutLineEnd) or standard dd

-- Ctrl+K → EditorCutLineEnd (delete to end of line)
map("n", "<C-k>", "d$", opts)

-- Ctrl+Backspace → EditorDeleteLine / Delete entire line
map("n", "<C-Backspace>", "dd", opts)

-- Delete → EditorDelete
map("n", "<Del>", "x", opts)

-- Backspace → EditorBackSpace
map("n", "<Backspace>", "X", opts)

-- Shift+Enter → EditorStartNewLine
map("n", "<S-Enter>", "O", opts)

-- Ctrl+Shift+J → EditorJoinLines
map("n", "<C-S-j>", "J", opts)

-- Ctrl+Shift+Space → SmartTypeCompletion
-- map("n", "<C-S-Space>", ..., opts)  -- NOTE: requires completion plugin

-- Ctrl+Space → CodeCompletion
-- map("n", "<C-Space>", ..., opts)  -- NOTE: requires completion plugin

-- Ctrl+Alt+Space → ClassNameCompletion
-- map("n", "<C-A-Space>", ..., opts)  -- NOTE: requires completion plugin

-- Ctrl+Period → EditorChooseLookupItemDot
-- map("n", "<C-.>", ..., opts)  -- NOTE: requires completion plugin

-- Ctrl+Shift+/ → CommentByBlockComment
map("n", "<C-S-/>", "gbc", { remap = true })
map("v", "<C-S-/>", "gb", { remap = true })

-- Ctrl+Alt+I → AutoIndentLines (reformat/indent)
map("n", "<C-A-i>", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Ctrl+Alt+Shift+O → OptimizeImports
-- map("n", "<C-A-S-o>", ..., opts)  -- NOTE: requires LSP-based import optimization

-- Ctrl+J → QuickJavaDoc (hover/documentation)
map("n", "<C-j>", vim.lsp.buf.hover, opts)

-- Ctrl+Shift+P → ExpressionTypeInfo (type info)
map("n", "<C-S-p>", vim.lsp.buf.hover, opts)

-- Shift+F1 → ExternalJavaDoc
-- map("n", "<S-F1>", ..., opts)  -- NOTE: requires external doc integration

-- Ctrl+Shift+Q → EditorContextInfo
-- map("n", "<C-S-q>", ..., opts)  -- NOTE: requires context info popup

-- Ctrl+Alt+Q → ToggleRenderedDocPresentation
-- map("n", "<C-A-q>", ..., opts)  -- NOTE: requires rendered doc mode

-- Alt+Left → EditorPreviousWord
map("n", "<A-Left>", "b", opts)

-- Alt+Shift+Left → EditorPreviousWordWithSelection
map("n", "<A-S-Left>", "vb", opts)

-- Alt+Right → EditorNextWord
map("n", "<A-Right>", "w", opts)

-- Alt+Shift+Right → EditorNextWordWithSelection
map("n", "<A-S-Right>", "vw", opts)

-- Alt+Backspace → EditorDeleteToWordStart
map("n", "<A-Backspace>", "dB", opts)

-- Alt+Delete → EditorDeleteToWordEnd
map("n", "<A-Del>", "dE", opts)

-- Ctrl+Z → $Undo
map("n", "<C-z>", "u", opts)

-- Ctrl+Shift+Z → $Redo (note: standard vim uses Ctrl+R)
map("n", "<C-S-z>", "<C-r>", opts)

--================================================
-- REFACTORING & CODE ACTIONS
--================================================

-- Ctrl+T → Refactorings.QuickListPopupAction (refactor menu)
map("n", "<C-t>", vim.lsp.buf.code_action, opts)

-- Ctrl+I → ImplementMethods
-- map("n", "<C-i>", ..., opts)  -- NOTE: requires implementation generation

-- Alt+Shift+O → OverrideMethods
-- map("n", "<A-S-o>", ..., opts)  -- NOTE: requires override generation

-- Ctrl+Alt+Shift+G → SelectAllOccurrences
-- map("n", "<C-A-S-g>", ..., opts)  -- NOTE: requires multi-cursor plugin

-- Ctrl+G → SelectNextOccurrence
-- map("n", "<C-g>", ..., opts)  -- NOTE: requires multi-cursor plugin (conflicts with Find Next)

-- Ctrl+Shift+G → UnselectPreviousOccurrence
-- map("n", "<C-S-g>", ..., opts)  -- NOTE: requires multi-cursor plugin (conflicts with Find Previous)

--================================================
-- RENAME & REFACTOR
--================================================

-- F2 → GotoFile (but in context, used for rename in many IDEs)
-- Using Snacks for file navigation

-- Alt+F3 → ToggleBookmarkWithMnemonic
-- map("n", "<A-F3>", ..., opts)  -- NOTE: requires bookmark plugin

-- Shift+F6 → Rename (standard in IntelliJ, but not in this keymap)
-- Using standard Neovim LSP rename
map("n", "<F6>", vim.lsp.buf.rename, opts)

--================================================
-- BOOKMARKS & MARKS
--================================================

-- F3 → ToggleBookmark / Smart Mark (preserved from original)
map("n", "<F3>", ToggleSmartMark, opts)

-- Ctrl+F3 → ShowBookmarks
-- map("n", "<C-F3>", ..., opts)  -- NOTE: requires bookmark plugin

-- Ctrl+0 to Ctrl+9 → GotoBookmark0-9
-- Ctrl+Shift+0 to Ctrl+Shift+9 → ToggleBookmark0-9
-- map("n", "<C-0>", ..., opts)  -- NOTE: requires bookmark plugin
-- ... (repeat for 1-9)

--================================================
-- NAVIGATION & BUFFER/TAB MANAGEMENT
--================================================

-- Ctrl+Tab → Switcher (buffer switcher)
map("n", "<C-Tab>", "<cmd>Telescope buffers<CR>", opts)

-- Ctrl+Shift+Tab → Diff.FocusOppositePaneAndScroll / Switcher backward
map("n", "<C-S-Tab>", Snacks.picker.buffers, opts)

-- Ctrl+Shift+[ → PreviousTab / Diff.PrevChange
map("n", "<C-S-[>", "<cmd>bprevious<CR>", opts)

-- Ctrl+Shift+] → NextTab / Diff.NextChange
map("n", "<C-S-]>", "<cmd>bnext<CR>", opts)

-- Ctrl+Alt+Shift+Left → PreviousEditorTab
map("n", "<C-A-S-Left>", "<cmd>bprevious<CR>", opts)

-- Ctrl+Alt+Shift+Right → NextEditorTab
map("n", "<C-A-S-Right>", "<cmd>bnext<CR>", opts)

-- Ctrl+Alt+` → NextProjectWindow
-- map("n", "<C-A-`>", ..., opts)  -- NOTE: requires project window management

-- Ctrl+Alt+Shift+` → PreviousProjectWindow
-- map("n", "<C-A-S-`>", ..., opts)  -- NOTE: requires project window management

-- Ctrl+W → CloseContent / Close tab
map("n", "<C-w>", "<cmd>bdelete<CR>", opts)

-- Ctrl+Shift+F4 → CloseActiveTab
map("n", "<C-S-F4>", "<cmd>bdelete<CR>", opts)

-- Ctrl+Q → Exit
-- map("n", "<C-q>", "<cmd>qa<CR>", opts)  -- Dangerous, commented out

-- Ctrl+M → MinimizeCurrentWindow
-- map("n", "<C-m>", ..., opts)  -- NOTE: requires window management

-- Ctrl+= → ZoomCurrentWindow
-- map("n", "<C-=>", ..., opts)  -- NOTE: requires window zoom

-- Ctrl+Alt+Shift+F → ToggleFullScreen
-- map("n", "<C-A-S-f>", ..., opts)  -- NOTE: requires fullscreen toggle

--================================================
-- NAVIGATION & MOTION
--================================================

-- Home → EditorLineStart
map("n", "<Home>", "0", opts)

-- End → EditorLineEnd
map("n", "<End>", "$", opts)

-- Ctrl+Left → EditorLineStart
map("n", "<C-Left>", "0", opts)

-- Ctrl+Right → EditorLineEnd
map("n", "<C-Right>", "$", opts)

-- Ctrl+Home → EditorLineStart (top of file)
map("n", "<C-Home>", "gg", opts)

-- Ctrl+End → EditorLineEnd (end of file)
map("n", "<C-End>", "G", opts)

-- Ctrl+Shift+Left → EditorLineStartWithSelection
map("n", "<C-S-Left>", "v0", opts)

-- Ctrl+Shift+Right → EditorLineEndWithSelection
map("n", "<C-S-Right>", "v$", opts)

-- Up → EditorUp
map("n", "<Up>", "k", opts)

-- Down → EditorDown
map("n", "<Down>", "j", opts)

-- Left → EditorLeft
map("n", "<Left>", "h", opts)

-- Right → EditorRight
map("n", "<Right>", "l", opts)

-- Ctrl+Alt+Up → MethodUp / GotoPrevElementUnderCaretUsage
map("n", "<C-A-Up>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- Ctrl+Alt+Down → MethodDown / GotoNextElementUnderCaretUsage
map("n", "<C-A-Down>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Ctrl+Alt+[ → EditorCodeBlockStart
map("n", "<C-A-[>", "[[", opts)

-- Ctrl+Alt+] → EditorCodeBlockEnd
map("n", "<C-A-]>", "]]", opts)

-- Ctrl+Alt+Shift+[ → EditorCodeBlockStartWithSelection
map("n", "<C-A-S-[>", "v[[", opts)

-- Ctrl+Alt+Shift+] → EditorCodeBlockEndWithSelection
map("n", "<C-A-S-]>", "v]]", opts)

-- Ctrl+Alt+M → EditorMatchBrace
map("n", "<C-A-m>", "%", opts)

-- Ctrl+Shift+Down → ShowContent
map("n", "<C-S-Down>", "G", opts)

-- Ctrl+Up → ShowNavBar / SearchEverywhere.NavigateToPrevGroup
map("n", "<C-Up>", "gg", opts)

-- Alt+Home → ShowNavBar
-- map("n", "<A-Home>", ..., opts)  -- NOTE: requires nav bar

-- Ctrl+Alt+Shift+PageDown → NextSplitter
-- map("n", "<C-A-S-PageDown>", ..., opts)  -- NOTE: requires split management

-- Ctrl+Alt+Shift+PageUp → PrevSplitter
-- map("n", "<C-A-S-PageUp>", ..., opts)  -- NOTE: requires split management

--================================================
-- RUNNING & DEBUGGING
--================================================

-- Ctrl+Alt+R → Run
-- map("n", "<C-A-r>", dap.run_last, opts)  -- NOTE: requires dap configuration

-- Ctrl+Alt+D → Debug
map("n", "<C-A-d>", dap.continue, opts)

-- Ctrl+Alt+Shift+R → ChooseRunConfiguration
-- map("n", "<C-A-S-r>", ..., opts)  -- NOTE: requires dap UI

-- Ctrl+Alt+Shift+D → ChooseDebugConfiguration
-- map("n", "<C-A-S-d>", ..., opts)  -- NOTE: requires dap UI

-- Ctrl+R → Refresh / Rerun
-- map("n", "<C-r>", dap.run_last, opts)  -- conflicts with search

-- Ctrl+Shift+C → RunClass
-- map("n", "<C-S-c>", dap.run_last, opts)  -- NOTE: requires dap configuration

-- Ctrl+Shift+D → DebugClass (differs from ChooseDebugConfiguration)
-- map("n", "<C-S-d>", dap.continue, opts)  -- conflicts with other bindings

-- Ctrl+Shift+F10 → RunClass (alternative keybinding)
-- map("n", "<C-S-F10>", dap.run_last, opts)

-- Ctrl+Shift+F9 → DebugClass (alternative keybinding)
-- map("n", "<C-S-F9>", dap.continue, opts)

-- F9 → Resume / Continue
map("n", "<F9>", dap.continue, opts)

-- Alt+Shift+R → RerunTests
-- map("n", "<A-S-r>", ..., opts)  -- NOTE: requires test runner

-- Alt+Shift+F5 → XDebugger.AttachToProcess
-- map("n", "<A-S-F5>", ..., opts)  -- NOTE: requires dap process attach

--================================================
-- BREAKPOINTS & STEPPING
--================================================

-- Ctrl+F8 or Shift+Ctrl+F8 → Toggle Breakpoint (note: using standard approach)
map("n", "<C-F8>", dap.toggle_breakpoint, opts)

-- F10 → Step over (standard Neovim)
map("n", "<F10>", dap.step_over, opts)

-- F11 → Step into (standard Neovim)
map("n", "<F11>", dap.step_into, opts)

-- Ctrl+Shift+F10 → Step out
map("n", "<C-S-F10>", dap.step_out, opts)

-- Alt+F9 → RunToCursor
-- map("n", "<A-F9>", dap.run_to_cursor, opts)

--================================================
-- DIAGNOSTICS & PROBLEMS
--================================================

-- F2 → FindNext (but also used for next error in many IDEs)
map("n", "<F2>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Shift+F3 → FindPrevious (standard mapping)
map("n", "<S-F3>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- Shift+Control+Alt+Up → VcsShowPrevChangeMarker
-- map("n", "<S-C-A-Up>", ..., opts)  -- NOTE: requires VCS plugin

-- Shift+Control+Alt+Down → VcsShowNextChangeMarker
-- map("n", "<S-C-A-Down>", ..., opts)  -- NOTE: requires VCS plugin

--================================================
-- VCS / GIT OPERATIONS
--================================================

-- Ctrl+E → Vcs.ShowMessageHistory
-- map("n", "<C-e>", ..., opts)  -- NOTE: requires git plugin (conflicts with search)

-- Ctrl+Shift+M → Vcs.MoveChangedLinesToChangelist / ChangesView.Move
-- map("n", "<C-S-m>", ..., opts)  -- NOTE: requires git plugin

-- Ctrl+Shift+V → Vcs.QuickListPopupAction
-- map("n", "<C-S-v>", ..., opts)  -- NOTE: requires git plugin

-- Ctrl+Alt+Shift+T → Vcs.UpdateProject
-- map("n", "<C-A-S-t>", ..., opts)  -- NOTE: requires git plugin

-- Ctrl+Alt+A → VcsHistory.ShowAllAffected
-- map("n", "<C-A-a>", ..., opts)  -- NOTE: requires git plugin

--================================================
-- SETTINGS & CONFIGURATION
--================================================

-- Ctrl+, → ShowSettings (Preferences)
-- map("n", "<C-,>", ..., opts)  -- NOTE: manually edit config

-- Ctrl+; → ShowProjectStructureSettings
-- map("n", "<C-;>", ..., opts)  -- NOTE: manually edit config

-- Ctrl+Back_Quote → QuickChangeScheme
-- map("n", "<C-`>", ..., opts)  -- conflicts with terminal toggle

-- Ctrl+Alt+Shift+Space → EmojiAndSymbols
-- map("n", "<C-A-S-Space>", ..., opts)  -- NOTE: requires emoji picker

-- Ctrl+Shift+F1 → ContextHelp
-- map("n", "<C-S-F1>", ..., opts)  -- NOTE: requires help system

--================================================
-- OTHER
--================================================

-- Ctrl+N → NewElement / Generate / NewScratchFile
map("n", "<C-n>", Snacks.picker.files, opts)

-- Ctrl+Shift+N → NewScratchFile
map("n", "<C-S-n>", "<cmd>enew<CR>", opts)

-- Ctrl+Alt+N → NewElementSamePlace
-- map("n", "<C-A-n>", ..., opts)  -- NOTE: requires element generation

-- Ctrl+Delete → SafeDelete
-- map("n", "<C-Del>", "dd", opts)  -- NOTE: safer deletion (requires plugin)

-- Ctrl+Alt+F → ShowFilterPopup
-- map("n", "<C-A-f>", ..., opts)  -- NOTE: requires filter UI

-- Alt+Down → ShowSearchHistory
-- map("n", "<A-Down>", ..., opts)  -- NOTE: requires search history

-- Ctrl+Alt+Shift+O → ExportToTextFile
-- map("n", "<C-A-S-o>", ..., opts)  -- NOTE: requires export plugin

-- Ctrl+Shift+A → Find Action / Commands palette
map("n", "<C-S-a>", Snacks.picker.commands, opts)

-- Ctrl+Alt+F → ShowFilterPopup
-- map("n", "<C-A-f>", Snacks.picker.grep, opts)  -- NOTE: filter in search results

-- Ctrl+Space → CodeCompletion
-- Already mapped above

-- Alt+Up → MethodOverloadSwitchUp
-- map("n", "<A-Up>", ..., opts)  -- NOTE: requires method overload detection

-- Alt+Down → MethodOverloadSwitchDown
-- map("n", "<A-Down>", ..., opts)  -- NOTE: requires method overload detection

-- Shift+Control+T → ServiceView.ShowServices
-- map("n", "<S-C-T>", ..., opts)  -- NOTE: requires services view

-- Ctrl+Alt+H → CallHierarchy
-- map("n", "<C-A-h>", ..., opts)  -- NOTE: requires call hierarchy plugin

-- Ctrl+Alt+Shift+8 → EditorToggleColumnMode
map("n", "<C-A-S-8>", "<cmd>set virtualedit=all<CR>", opts)

-- Page_Down / Ctrl+Down → SearchEverywhere.NavigateToNextGroup
map("n", "<PageDown>", "20j", opts)

-- Page_Up / Ctrl+Up → SearchEverywhere.NavigateToPrevGroup
map("n", "<PageUp>", "20k", opts)
