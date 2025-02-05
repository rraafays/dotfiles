set -x DISPLAY aqua
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"
set -x PYTHONPATH "$HOME/Library/Python/3.8/lib/python/site-packages"
set -x PATH /run/current-system/sw/bin $PATH

if status --is-interactive
    function man
        command man -P 'nvim -c \'Man! -o -\'' $argv
    end

    if not fish_is_root_user
        function mount
            diskutil mountDisk $argv
        end
        function umount
            diskutil umountDisk $argv
        end
    end
end
