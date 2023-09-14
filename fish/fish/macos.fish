set -x LIBRARY_PATH "$LIBRARY_PATH:$(brew --prefix)/lib"
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"

function man -d 'man'
  command man -P 'nvim -c \'Man! -o -\'' $argv
end
function fixlogin -d 'fix login items and background tasks'
  sfltool resetbtm
end
function doas -d 'alias doas to sudo'
  sudo $argv
end
function yabai -d 'run yabai with dash'
  SHELL=/bin/dash command yabai $argv
end
function skhd -d 'run skhd with dash'
  SHELL=/bin/dash command skhd $argv
end
function lsblk -d 'alias lsblk to diskutil list'
  diskutil list
end

if not test -e "$HOME/.config/kitty/kitty.conf"
  cat                                   \
    "$HOME/.config/kitty/base.conf"     \
    "$HOME/.config/kitty/macos.conf"    \
  > "$HOME/.config/kitty/kitty.conf"
end
