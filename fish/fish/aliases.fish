# replacements
function grep -d 'replace grep with ripgrep'
    rg $argv
end
function ls -d 'replace ls with lsd'
    lsd $argv
end
function tree -d 'directory tree using lsd'
    lsd --tree $argv
end
function neofetch -d 'replace neofetch with fastfetch'
    fastfetch $argv
end

# rm -> rip
function graveyard -d 'visit the graveyard'
    z $HOME/.graveyard
end
function graves -d 'view graves'
    tree -a $HOME/.graveyard
end
function decompose -d 'decompose files in the graveyard'
    rip --decompose
end

# shorthands
function py -d 'shorthand python3'
    python3 $argv
end
function qr -d 'quickly generate qrcode'
    qrencode -t UTF8 -m 2 $argv
end
function za -d 'launch zathura in background'
    zathura $argv &
end
function vi -d 'shorthand nvim'
    nvim $argv
end
function t -d 'shorthand transmission-remote'
    transmission-remote $argv
end
function td -d 'shorthand transmission-daemon'
    transmission-daemon $argv
end
function tv -d 'watch transmissions'
    watch -n 1 transmission-remote -l
end

# media tools
function mpv -d 'mpv as image viewer'
    command mpv --no-terminal $argv &
end
function imv -d 'mpv as image viewer'
    command mpv --loop --window-maximized --no-terminal $argv &
end
function play -d 'mpv as audio player'
    command mpv --no-audio-display $argv
end
function icat -d 'image in kitty'
    kitty +kitten icat --align left $argv
end

# preference flags
function bat -d 'pretty cat'
    command bat --theme gruvbox-dark $argv
end
function scrcpy -d 'scrcpy with prefs'
    command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end
function duf -d '16 color duf'
    command duf -theme ansi $argv
end
function onefetch -d 'minimal onefetch'
    command onefetch --true-color never --no-color-palette --no-art --no-title
end
