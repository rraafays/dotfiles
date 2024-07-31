function rebuild
    if [ "$argv[1]" = config ]
        cd ~/.config/ || exit
        rm -rf "$(ls -1t .config/)"
        cd .config/ || exit
        stow .
        cd - || exit
    else
        switch (uname)
            case Darwin
                darwin-rebuild $argv
            case Linux
                nixos-rebuild $argv
        end
    end
end

function nsh
    nix-shell $argv
end

function run
    nix-shell --packages $argv[1] --run "$argv[1] $argv[2..]"
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
    mkdir --parents .notes/$YEAR/$MONTH &&
        if not test -e .notes/$YEAR/$MONTH/(date +"%d%m%Y-%A" | tr '[:upper:]' '[:lower:]').md
            echo (date +"# %d %m %Y %A" | tr '[:upper:]' '[:lower:]') >.notes/$YEAR/$MONTH/(date +"%d%m%Y-%A" | tr '[:upper:]' '[:lower:]').md
        end
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
