set -x BULLET_JOURNAL "$HOME/Documents/bullet_journal"

function nsh
    nix-shell $argv
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
        nix-shell --packages onefetch --run "onefetch --true-color never $argv"
    else
        nix-shell --packages neofetch --run "neofetch $argv"
    end
end

function qr
    nix-shell --packages qrencode --run "qrencode -t UTF8 -m 2 '$argv'"
end

function bujo
    z $BULLET_JOURNAL
end

function day
    set YEAR_MONTH (date +"%Y/%m-%B" | tr '[:upper:]' '[:lower:]')
    mkdir --parents $BULLET_JOURNAL/$YEAR_MONTH &&
        vi $BULLET_JOURNAL/$YEAR_MONTH/(date +"%d%m%Y-%A" | tr '[:upper:]' '[:lower:]').md
end

function month
    set YEAR_MONTH (date +"%Y/%m-%B" | tr '[:upper:]' '[:lower:]')
    mkdir --parents $BULLET_JOURNAL/$YEAR_MONTH &&
        vi $BULLET_JOURNAL/$YEAR_MONTH/(date +"%m%Y-%B" | tr '[:upper:]' '[:lower:]').md
end
