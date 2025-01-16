set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"
    set -x TTY $(tty)

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
end
