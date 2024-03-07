set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"

    if not pgrep -f Hyprland >/dev/null
        dbus-run-session Hyprland
    end

    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/unix.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function nsh
        command nix-shell $argv --run fish
    end

    function dotfiles
        rm -rf /home/raf/.config
        rm -rf /root/.config
        git clone https://github.com/rraafays/dotfiles /home/raf/.config
        sudo ln -s /home/raf/.config/ /root/.config
    end
end
