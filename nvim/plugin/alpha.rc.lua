local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.opts.hl = "GruvboxRed"
dashboard.section.header.val = {
    [[                              |`,                           ]],
    [[                               \1\.                         ]],
    [[                              /7606                         ]],
    [[                             ,/7|'6\,                       ]],
    [[                            ,/67  "0\                       ]],
    [[                           ,607' , \6\                      ]],
    [[                          ,600' ;7 :0;               ,      ]],
    [[                         /667   6' |0;             ,;7      ]],
    [[                       ,766"   ;7  ;6/           ,667'      ]],
    [[                     ,677"   ,/7   66'        ,66"67'       ]],
    [[                   ,677"   ,667   606       ,/7' |6/        ]],
    [[                 ,/77"    /70"   /66      ,77'  ,66         ]],
    [[                ,777'   ./67'   .66'    ,76"  , |7/         ]],
    [[               ,677     760'    667    ;77'  /' \66         ]],
    [[ `66,,_        67/     670'     67'   ;76'  :7  |66,        ]],
    [[  `60"606,_    67'    ,67/      66   ,667   \6   \66.       ]],
    [[   `66  "606,_ 66     |70|      67\  667    |6   '606.      ]],
    [[    66    `666,'6     `666      '66\,|67    '6    '606      ]],
    [[    67|  \, '66\6,     \66,       \60066     \;    \606     ]],
    [[    676   6, '66'\.   ,,\6660;,,   `"606\    `6,    '606,   ]],
    [[   ,66    ;\  66,  ,666//^*^*^*\6\,   "67\    66     `606\  ]],
    [[   677    ;7  '66,607'"         `\6\,   \6\   '6,      `60\ ]],
    [[  ,77     ;7   6006"    ,,,;;,,   `66,   66\   \6       \06,]],
    [[ ,67'     ;7   607/    66060606\,  '6|   606   '6\       606]],
    [[ 667      67   667    607     \66   77   606    66\      |06]],
    [[,66      ,7;   667   607   ,  667  ,67   607    |6/       66]],
    [[677      77;   606   607   ';;;'  ,77'  ,607    |6/      ,66]],
    [[677     ,77    606,   606,      ,667'  ,606'    76;      667]],
    [[676     /66,    606    660660066767    606'    /67'     ;67']],
    [[`76,    '66|    `606\,   `"""""'    ,6607'    ,677     667  ]],
    [[ `77,    \66,     `6606,,_     _,,66607"     ,777   ,,67'   ]],
    [[   `666,, `666,     `'"6660000007776"'     ,667' ,.7""      ]],
    [[            `666,,       ```''''         ,/767              ]],
    [[               `6666,,,__        __,,,67777"                ]],
    [[                   `""666666000000777"""'                   ]],
    [[                   `""666666000000777"""'                   ]],
    [[                                                            ]],
    string.format(
        "                          v%s.%s.%s",
        vim.version().major,
        vim.version().minor,
        vim.version().patch
    ),
}

local button = function(shortcut, text, command, hl)
    local button = dashboard.button(shortcut, text, command)
    button.opts.hl_shortcut = hl
    return button
end

dashboard.section.buttons.val = {
    button(
        "space",
        "global recents",
        "<cmd>Telescope frecency<cr>",
        "GruvboxOrange"
    ),
    button(
        "opt space",
        "workspace recents",
        "<cmd>Telescope frecency workspace=CWD<cr>",
        "GruvboxOrange"
    ),
    button(
        "f",
        "files",
        "<cmd>lua require('telescope.builtin').find_files({ no_ignore = false, hidden = true })<CR>",
        "GruvboxOrange"
    ),
    button(
        "g",
        "grep",
        "<cmd>lua require('telescope.builtin').live_grep()<CR>",
        "GruvboxOrange"
    ),
}

alpha.setup(dashboard.config)
