local notify = require("notify")

notify.setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = " ",
        TRACE = "󰛿 ",
        WARN = " "
    },
    level = 2,
    minimum_width = 40,
    render = "default",
    stages = "slide",
    timeout = 5000,
    top_down = true
})
