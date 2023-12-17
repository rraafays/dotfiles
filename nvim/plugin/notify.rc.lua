local notify = require("notify")

notify.setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = " ",
        TRACE = "󰛿 ",
        WARN = " ",
    },
    level = 2,
    minimum_width = 20,
    render = "default",
    stages = "slide",
    timeout = 3000,
    top_down = false,
})
