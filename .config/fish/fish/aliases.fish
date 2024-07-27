function vi
    lvim $argv
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
function fd
    command fd -u $argv
end
function tree
    ls --tree $argv
end
function bat
    command bat --theme gruvbox-dark $argv
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
