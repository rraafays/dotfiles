function vi
    nvim $argv
end

function ls
    lsd $argv
end
function tree
    lsd --tree $argv
end

function tls
    tmux ls -F " - #{session_name}"
end
function trm
    tmux kill-session -t $argv
end

function graveyard
    z $HOME/.graveyard
end
function graves
    tree -d $HOME/.graveyard
end
function decompose
    rip --decompose
end

function grep
    rg $argv
end

function ghee
    git log --graph --decorate --pretty=oneline --abbrev-commit
end

function qr
    qrencode -t UTF8 -m 2 $argv
end

function gitfetch
    command onefetch --true-color never --no-color-palette --no-art --no-title --text-colors 0 0 0 5 5 15
end
function onefetch
    command onefetch --true-color never
end
function py
    python3 $argv
end

function transmission
    transmission-remote $argv
end
function transmission-watch
    watch -n 1 "transmission-remote -l"
end
function transmission-list
    transmission-remote -l
end
function transmission-torrent
    transmission-remote -t $argv
end

function im
    kitty +kitten icat --align left $argv
end
function imv
    command mpv --loop --window-maximized --no-terminal --no-input-cursor $argv & disown
end
function mpv
    command mpv --no-terminal --no-input-cursor $argv & disown
end
function play
    command mpv --no-audio-display --no-input-cursor $argv
end
function scrcpy
    command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end
