set -x LIBRARY_PATH "$LIBRARY_PATH:$(brew --prefix)/lib"
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"
set -x DISPLAY "aqua"

if status --is-interactive
  if not test -e "$HOME/.config/kitty/kitty.conf"
    cat                                   \
      "$HOME/.config/kitty/base.conf"     \
      "$HOME/.config/kitty/macos.conf"    \
    > "$HOME/.config/kitty/kitty.conf"
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
  function neofetch
    echo
    command neofetch --ascii ~/.config/ascii/apple_neofetch --ascii_colors 8 $argv
  end
  function cpufetch
    command cpufetch --color 146,131,115:142,192,123:0,0,0:142,192,123:235,219,178
  end
end
