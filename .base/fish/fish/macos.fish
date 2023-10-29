set -x DISPLAY aqua
set -x LIBRARY_PATH "$LIBRARY_PATH:$(brew --prefix)/lib"
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"

if status --is-interactive
    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/macos.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function man
        command man -P 'nvim -c \'Man! -o -\'' $argv
    end
    function fixlogin
        sfltool resetbtm
    end
    function yabai
        SHELL=/bin/dash command yabai $argv
    end
    function skhd
        SHELL=/bin/dash command skhd $argv
    end
    function lsblk
        diskutil list
    end
    function brew
        if count $argv >/dev/null
            command brew $argv
        else
            command brew update
            command brew upgrade --no-quarantine
            command brew upgrade --no-quarantine --cask --greedy
            command brew autoremove
            command brew cleanup
        end
    end
end
