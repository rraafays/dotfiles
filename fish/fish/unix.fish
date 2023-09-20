set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
  set -x MANPAGER "nvim -c 'Man! -o -'"

  if not test -e "$HOME/.config/kitty/kitty.conf"
    cat                                   \
      "$HOME/.config/kitty/base.conf"     \
      "$HOME/.config/kitty/unix.conf"     \
    > "$HOME/.config/kitty/kitty.conf"
  end

  function cpufetch
    command cpufetch --color 146,131,115:204,35,28:0,0,0:204,35,28:235,219,178
  end
  function hypr
    dbus-run-session Hyprland
  end
end
