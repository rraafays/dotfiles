nix-your-shell fish | source

function before-nix-darwin
    sudo mv nix.conf nix.conf.before-nix-darwin
end

function rebuild
    if [ "$argv[1]" = config ]
        cd ~/.config/ || exit
        rm -rf "$(ls -1t .config/)"
        cd .config/ || exit
        nix-shell --packages stow --run "stow ."
        cd - || exit
    else
        before-nix-darwin
        darwin-rebuild $argv -I "darwin-config=/etc/nix-darwin/configuration.nix"
        if test -e result
            rm result
        end
    end
end
