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
    ll --color always | grep "=>" --color never
end

function kbd
    cat ~/.config/etc/ascii/hhkb
end

function music
    set command $argv[1]
    switch $command
        case clean
            if test -z "$argv[2]"
                echo "Usage: music clean <directory>"
                return 1
            end
            remove_folders_that_dont_contain_audio $argv[2]
        case resync
            if test -z "$argv[2]"
                echo "Usage: music resync <directory>"
                return 1
            end
            rsync --recursive --human-readable --info=progress2 --stats --delete ~/Music $argv[2]
        case sync
            set source_dir "$HOME/Music"
            set target_dir "./Music"
            if not test -d $target_dir
                mkdir $target_dir
            end
            for dir in $source_dir/*
                if test -d $dir
                    set dir_name (basename $dir)
                    if not test -d "$target_dir/$dir_name"
                        rsync -av --progress "$dir/" "$target_dir/$dir_name/"
                    end
                end
            end
        case '*'
            echo "Usage: music <command> [reset|import|covers|clean|resync|sync]"
    end
end
