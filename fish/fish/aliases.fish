function vi
    nvim $argv
end
function ls
    lsd $argv
end
function grep
    rg $argv
end
function cat
    bat $argv
end
function py
    python3 $argv
end
function fd
    command fd -u $argv
end
function tree
    ls --tree $argv
end
function qr
    qrencode -t UTF8 -m 2 $argv
end
function bat
    command bat --theme gruvbox-dark $argv
end
function onefetch
    command onefetch --true-color never $argv
end
function im
    kitty +kitten icat --align left $argv
end
function imv
    mpv --loop --window-maximized --no-terminal --no-input-cursor $argv
end
function play
    mpv --no-audio-display --no-input-cursor $argv
end
function duf
    command duf -theme ansi $argv
end
