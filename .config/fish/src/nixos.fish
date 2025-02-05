function rebuild
    if [ "$argv[1]" = config ]
        cd ~/.config/ || exit
        rm -rf "$(ls -1t .config/)"
        cd .config/ || exit
        nix-shell --packages stow --run "stow ."
        cd - || exit
    else if [ "$argv[1]" = upgrade ]
        if not fish_is_root_user
            sudo nixos-rebuild switch --upgrade --install-bootloader
        else
            nixos-rebuild switch --upgrade --install-bootloader
        end
        if test -e result
            rm result
        end
    else if [ "$argv[1]" = timers ]
        systemctl status nixos-upgrade.timer
        systemctl status nix-optimise.timer
        systemctl status nix-gc.timer
        return 0
    else if [ "$argv[1]" = logs ]
        systemctl status nixos-upgrade.service
        systemctl status nix-optimise.service
        systemctl status nix-gc.service
        return 0
    else
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
