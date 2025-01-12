function rebuild
    if [ "$argv[1]" = config ]
        cd ~/.config/ || exit
        rm -rf "$(ls -1t .config/)"
        cd .config/ || exit
        nix-shell --packages stow --run "stow ."
        cd - || exit
    else
        switch (uname)
            case Darwin
                darwin-rebuild $argv
            case Linux
                if not fish_is_root_user
                    sudo nixos-rebuild $argv
                else
                    nixos-rebuild $argv
                end
                if test -e result
                    rm result
                end
        end
    end
end

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

function open
    if not test -e $argv[1]
        $argv & disown
    else
        command xdg-open $argv[1]
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
    nix-shell $argv
end

function lls
    l --color always | grep "=>" --color never
end

function kbd
    cat ~/.config/etc/ascii/hhkb
end

function chat
    if test (count $argv) -eq 0
        echo "Please provide a Twitch channel name with --channel."
    else
        kitty -o remember_window_size=no -o initial_window_height=20c -o initial_window_width=60c ttchat $argv & disown
    end
end
