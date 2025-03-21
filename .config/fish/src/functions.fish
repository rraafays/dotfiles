function src
    if test -e src
        tree src --color=always | bat -p
    else
        echo "there is no source directory!"
        return 1
    end
end

function lsm
    if test -e .gitmodules
        grep "path|url" .gitmodules | awk '{print $3}' | sed 'N;s/\n/ -> /' | bat -p
    else
        echo "there are no modules!"
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

function nsh
    nix-shell --run fish $argv
end

function lls
    ll --all --color always | grep "=>" --color never
end

function kbd
    cat ~/.config/etc/ascii/hhkb
end

function envrc
    touch .envrc
    direnv allow
end

function use
    switch "$argv[1]"
        case nix
            echo "use nix" >.envrc
            direnv allow
        case flake
            echo "use flake" >.envrc
            direnv allow
        case '*'
            return 1
    end
end
