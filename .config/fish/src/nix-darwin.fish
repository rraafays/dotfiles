nix-your-shell fish | source

function rebuild
    if [ "$argv[1]" = config ]
        cd ~/.config/ || exit
        rm -rf "$(ls -1t .config/)"
        cd .config/ || exit
        nix-shell --packages stow --run "stow ."
        cd - || exit
    else
        darwin-rebuild $argv -I "darwin-config=/etc/nix-darwin/configuration.nix"
        if test -e result
            rm result
        end
    end
end
