local notify = require("notify")
notify.setup({
    level = vim.log.levels.INFO,
    timeout = 5000,
    max_width = 100,
    max_height = nil,
    stages = "slide",
    render = "default",
    background_colour = "NotifyBackground",
    on_open = nil,
    on_close = nil,
    minimum_width = 50,
    fps = 175,
    top_down = true,
    time_formats = {
        notification_history = "%FT%T",
        notification = "%T",
    },
    icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = "✎ ",
    },
})
