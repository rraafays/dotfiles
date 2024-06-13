set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "lvim -c 'Man! -o -'"
    set -x TTY $(tty)

    if test "$TTY" = /dev/tty1
        while true
            Hyprland
        end
    end

    if test "$TTY" = /dev/tty2
        while true
            gamescope --adaptive-sync -r 175 -e -- steam -bigpicture
        end
    end

    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/unix.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    if not fish_is_root_user
        function mount
            udisksctl mount --block-device $argv
        end
        function umount
            udisksctl unmount --block-device $argv
        end
    end

    function dotfiles
        rm -rf /home/raf/.config
        rm -rf /root/.config
        git clone https://github.com/rraafays/dotfiles /home/raf/.config
        sudo ln -s /home/raf/.config/ /root/.config
    end
end
