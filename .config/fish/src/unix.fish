set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"
    set -x TTY $(tty)

    if not fish_is_root_user
        function mount
            udisksctl mount --block-device $argv
        end
        function umount
            udisksctl unmount --block-device $argv
        end
    end

    function open
        if not test -e $argv[1]
            $argv & disown
        else
            command xdg-open $argv[1]
        end
    end
end
