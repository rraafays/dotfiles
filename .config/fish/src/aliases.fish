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
function fd
    command fd -u $argv
end
function tree
    ls --tree $argv
end
function bat
    command bat --theme ansi $argv
end
function im
    kitty +kitten icat --align left $argv
end
function imv
    mpv --image-display-duration=inf --no-terminal $argv
end
function duf
    command duf -theme ansi $argv
end
function typer
    command typer --config ~/.config/typer/typer.yaml $argv
end
function music
    rmpc $argv
end
function lyrics
    sptlrx $argv
end
function cover
    feh --reload=1 ~/cover.jpg & disown
end
