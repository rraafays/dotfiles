if [ "$MANPAGER" != "nvim -c 'Man! -o -'" ]
  set MANPAGER "nvim -c 'Man! -o -'"
end

set -x ANDROID_HOME "$HOME/Android/Sdk"

function hypr -d 'launch hyprland'
  Hyprland
end

if not test -e "$HOME/.config/kitty/kitty.conf"
  cat                                   \
    "$HOME/.config/kitty/base.conf"     \
    "$HOME/.config/kitty/unix.conf"     \
  > "$HOME/.config/kitty/kitty.conf"
end
