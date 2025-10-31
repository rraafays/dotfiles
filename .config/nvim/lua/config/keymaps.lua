local map = vim.keymap.set

map("n", "<F2>", "<cmd>lua vim.diagnostic.goto_next()<cr>")
map("n", "<S-F2>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

map("n", "<M-1>", Snacks.picker.explorer)
map("n", "<M-2>", Snacks.picker.marks)

map("n", "<M-F12>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end)
map("t", "<M-F12>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end)
map("n", "<C-f>", function()
  Snacks.picker.files()
end)

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
