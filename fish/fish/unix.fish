set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
    set -x MANPAGER "nvim -c 'Man! -o -'"

    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/unix.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function doas
        command doas fish -c "$argv"
    end

    function pacman
        if type -q paru
            if count $argv >/dev/null
                command paru $argv
            else
                paru --sync --refresh --sysupgrade
            end
        else
            if count $argv >/dev/null
                command pacman $argv
            else
                if fish_is_root_user
                    pacman --sync --refresh --sysupgrade
                else
                    doas pacman --sync --refresh --sysupgrade
                end
            end
        end
    end
end
