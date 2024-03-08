
function nsh
    command nix-shell $argv --run fish
end

function clean
    if set -q TMUX
        clear
        tmux clear-history
    else
        command clear
    end
end

function fetch
    if test -e .git
        onefetch $argv
    else
        fastfetch $argv
    end
end
