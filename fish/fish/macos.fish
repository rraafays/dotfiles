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
    function doas
        sudo fish -c "$argv"
    end
    function wolf
        open -a LibreWolf
    end
    function sqldev
        open -a SQLDeveloper
    end
    function utm
        open -a UTM
    end
    function intellij
        open -a "Intellij IDEA"
    end
    function chrome
        open -a "Google Chrome"
    end
end
