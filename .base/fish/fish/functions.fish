function snake
    perl -pe 's#([A-Z])#_\L$1#g' | perl -pe 's#^_##'
end

function fd
    command fd -u $argv
end

function bat
    command bat --theme gruvbox-dark $argv
end

function `
    starship toggle username
    starship toggle hostname
    clear
end
function =
    starship toggle line_break
    clear
end

function clear
    if set -q TMUX
        tmux send-keys -R
    else
        command clear
    end
end
function clean
    if set -q TMUX
        clear
        tmux clear-history
    else
        command clear
    end
end

function user-dirs-update
    mkdir "$HOME/desktop"
    mkdir "$HOME/downloads"
    mkdir "$HOME/templates"
    mkdir "$HOME/public"
    mkdir "$HOME/documents"
    mkdir "$HOME/music"
    mkdir "$HOME/pictures"
    mkdir "$HOME/videos"
    xdg-user-dirs-update
end

function cargo
    if count $argv >/dev/null
        command cargo $argv
    else
        command cargo install-update --all
    end
end
