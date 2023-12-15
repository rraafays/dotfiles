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
        if type -q rustup
            rustup update
        end
        command cargo install-update --all
    end
end