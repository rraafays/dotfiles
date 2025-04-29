function clean
    if set -q TMUX
        clear
        tmux clear-history
    else
        command clear
    end
end
