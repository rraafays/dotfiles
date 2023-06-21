local alpha = require("alpha")
local dashboard = require('alpha.themes.dashboard')

 dashboard.section.header.val = {
[[                         .&dkl`,ivne._]],
[[                         sRfkgvc+rsnmGBND.]],
[[                       aHBNLbni+.irumLGNMms]],
[[                       NRIr`'+dLKNMFb`'iNQr]],
[[                      `ANWM7    `+lM0.  `'^Kl]],
[[                      iNWL*_;=e.     Y._,_ ON]],
[[                      aRNm   _.l,    j^ _` Bq,]],
[[                      eNL:,l=N0`.   ls`N0> ibK]],
[[                      XHZu!       _(c      kPBN]],
[[                       'CD   .     `      tK7KX]],
[[                         'f     _&zrc_.  .Y       welcome]],
[[    ,                      v,   `ta.="  ,V]],
[[   7q. 6%                   ^l     =   .r]],
[[   f'noib. +                `d+   .._a7                     t]],
[[   k+RD6 L.dr                h'  `*+iPb                  .f adI`]],
[[   dj+Ggr 4NJb            .,dT     `'KJc                 _ir+4b .]],
[[     `cl^ ._ tk.   .,&;:rf"t&;       'yIKbr;.         dp` luhrZti]],
[[        `~.  ^_T `ysf'      " n,     7     *lkr,.   i7k._m.JKiV"]],
[[           J  .H dY   `"-              ._``    "VK,4=   . Kdj`]],
[[           K   K B               -s&.            eJ+  .ys7^`]],
[[           T   lLj                               (C' .4]],
[[           P   'y    .,                      .   +j  7]],
[[          ,y   b,     l          .`         ,t   Y`  Y]],
[[          4`    i     J`         g,         ti  .l   k]],
[[          Y     G    p"  -                -  "i`J    p]],
[[          L     .~  74. `W`              '`W  9+y    b.]],
[[          N       .Y 6s,     _.      ..      ;T;     gl]],
[[          A       y   *Yf+:'`        `^*:pfjVK+i     tb]],
[[           Y.   j"     K                  .J`X.f     ly]],
[[            Tj V       T.                 il .Vj    .j']],
[[             +'        fi                 J`   L.   y]],
[[                       'y        -       .Y     Yz,V]],
[[                       .7        .       'A       +]],
[[                      .V        ,i        Tj]],
[[                     xY         fG         ki]],
[[                    tl                      K.]],
[[                    K                        Jb]],
[[                   ,I                        zH]],
[[                   T                          I]],
[[                   K                           N]],
}

dashboard.section.buttons.val = {
    dashboard.button("n", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
    dashboard.button("/", "󰺮  Find text", ":Telescope live_grep <CR>"),
}

alpha.setup(dashboard.config)
