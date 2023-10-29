set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"

    if test -e $DISPLAY
        dbus-run-session cage kitty
    end
    if not test -e $DISPLAY && not pgrep wireplumber &>/dev/null
        gentoo-pipewire-launcher restart &>/dev/null &
        wlr-randr --output DP-3 --custom-mode 1280x1024@67
        disown (jobs -p) &>/dev/null &
    end

    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/unix.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function hypr
        dbus-run-session Hyprland
    end
    function emerge
        if not fish_is_root_user
            if count $argv >/dev/null
                command emerge $argv
            else
                doas emerge --sync --verbose
                doas emerge --verbose --update --deep --newuse @world
                doas emerge --depclean
            end
        else
            if count $argv >/dev/null
                command emerge $argv
            else
                emerge --sync --verbose
                emerge --verbose --update --deep --newuse @world
                emerge --depclean
            end
        end
    end
    function idea
        idea-community $argv
    end
end
