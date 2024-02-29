function upgrade
    if type -q emerge
        emerge
    end
    if type -q brew
        brew
    end
    if type -q cargo
        cargo
    end
end

function cargo
    if count $argv >/dev/null
        command cargo $argv
    else
        command cargo install \
            doro \
            proverb \
            barish
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

function fetch
    fastfetch $argv
end
