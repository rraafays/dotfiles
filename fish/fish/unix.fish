set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
  set -x MANPAGER "nvim -c 'Man! -o -'"

  if not test -e "$HOME/.config/kitty/kitty.conf"
    cat                                   \
      "$HOME/.config/kitty/base.conf"     \
      "$HOME/.config/kitty/unix.conf"     \
    > "$HOME/.config/kitty/kitty.conf"
  end

  function hypr
    dbus-run-session Hyprland
  end
end
