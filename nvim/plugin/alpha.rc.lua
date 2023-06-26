local alpha = require("alpha")
local dashboard = require('alpha.themes.dashboard')

 dashboard.section.header.val = {
    [[           /\         ]],
    [[          /  \        ]],
    [[         /\ \ \       ]],
    [[        /\ \ \ \      ]],
    [[       /\ \ \ \/\     ]],
    [[      / /\ \ \/ /\    ]],
    [[     / / /\  / / /\   ]],
    [[    / / /  \/ / /  \  ]],
    [[    \  / / /\  / / /  ]],
    [[     \/ / /  \/ / /   ]],
    [[      \/ /\ \ \/ /    ]],
    [[       \/\ \ \ \/     ]],
    [[        \ \ \ \/      ]],
    [[         \ \ \/       ]],
    [[          \  /        ]],
    [[           \/         ]],
}

dashboard.section.buttons.val = {
    dashboard.button("n", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
    dashboard.button("/", "󰺮  Find text", ":Telescope live_grep <CR>"),
}

alpha.setup(dashboard.config)
