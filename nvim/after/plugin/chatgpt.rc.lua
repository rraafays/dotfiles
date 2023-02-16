local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

vim.keymap.set('n', '<A-g>', ':ChatGPT<CR>')
vim.keymap.set('n', '<A-i>', ':ChatGPTEditWithInstructions<CR>')

chatgpt.setup({
  welcome_message = WELCOME_MESSAGE, 
  loading_text = "loading",
  question_sign = ">",
  answer_sign = "<",
  max_line_length = 120,
  yank_register = "+",
  chat_layout = {
    relative = "win",
    position = "50%",
    size = {
      height = "80%",
      width = "80%",
    },
  },
  settings_window = {
    border = {
      style = "rounded",
      text = {
        top = " Settings ",
      },
    },
  },
  chat_window = {
    filetype = "chatgpt",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " ChatGPT ",
      },
    },
  },
  chat_input = {
    prompt = "> ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
  },
  openai_params = {
    model = "text-davinci-003",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "<Esc>" },
    yank_last = "<A-y>",
    scroll_up = "<A-Tab>",
    scroll_down = "<A-S-Tab>",
    toggle_settings = "<A-o>",
    new_session = "<A-n>",
    cycle_windows = "<Tab>",
  },
})
