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
    tree ~/Documents/bullet_journal/
end

function note
    set YEAR (date +"%Y" | tr '[:upper:]' '[:lower:]')
    set MONTH (date +"%m-%B" | tr '[:upper:]' '[:lower:]')
    mkdir --parents .notes &&
        vi .notes/$YEAR/$MONTH/(date +"%d%m%Y-%A" | tr '[:upper:]' '[:lower:]').md
end

function notes
    if test -e .notes
        tree .notes
    else
        echo "no notes in current directory!"
        return 1
    end
end

function lls
    ll --color always | grep "=>" --color never
end
