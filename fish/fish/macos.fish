set -x DISPLAY aqua
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"
set -x PYTHONPATH "$HOME/Library/Python/3.8/lib/python/site-packages"

if status --is-interactive
    if not test -e "$HOME/.config/kitty/kitty.conf"
        cat \
            "$HOME/.config/kitty/base.conf" \
            "$HOME/.config/kitty/macos.conf" >"$HOME/.config/kitty/kitty.conf"
    end

    function man
        command man -P 'nvim -c \'Man! -o -\'' $argv
    end
end
