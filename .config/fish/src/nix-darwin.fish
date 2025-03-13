nix-your-shell fish | source

function rebuild
    if not test -r /Library/Application\ Support/com.apple.TCC/
        osascript -e 'tell application "System Events" to display dialog "Please grant Full Disk Access to the terminal in the Security & Privacy preferences."'
        open 'x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles'
    end
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
