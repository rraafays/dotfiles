set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"

    if test -e $WAYLAND_DISPLAY
        dbus-run-session Hyprland
    end

    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/unix.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function doas
        command doas fish -c "$argv"
    end

    function nsh
        command nix-shell $argv --run fish
    end

    function iosevka
        rm -rf $HOME/.local/share/fonts
        mkdir $HOME/.local/share/fonts
        curl -s "https://api.github.com/repos/be5invis/Iosevka/releases/latest" | jq -r ".assets[] | .browser_download_url" | grep -i ttf-iosevkatermcurly- | xargs -n 1 curl -o $HOME/.local/share/fonts/iosevka.zip -L -O --fail --show-error
        7z -aoa x $HOME/.local/share/fonts/iosevka.zip -o$HOME/.local/share/fonts/
    end

    function dotfiles
        rm -rf /home/raf/.config
        rm -rf /root/.config
        git clone https://github.com/rraafays/dotfiles /home/raf/.config
        sudo ln -s /home/raf/.config/ /root/.config
    end
end
