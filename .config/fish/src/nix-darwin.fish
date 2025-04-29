function rebuild
    switch "$argv[1]"
        case config
            cd ~/.config/ || exit
            rm -rf "$(ls -1t .config/)"
            cd .config/ || exit
            nix-shell --packages stow --run "stow ."
            cd - || exit
        case upgrade
            sudo nix-channel --update
            darwin-rebuild switch $argv[2..-1] -I "darwin-config=/etc/nix-darwin/configuration.nix"
            if test -e result
                rm result
            end
        case '*'
            darwin-rebuild $argv -I "darwin-config=/etc/nix-darwin/configuration.nix"
            if test -e result
                rm result
            end
    end
end
