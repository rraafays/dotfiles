if [ "$MANPAGER" != "nvim -c 'Man! -o -'" ]
  set MANPAGER "nvim -c 'Man! -o -'"
end

set -x BEMENU_OPTS "--fn 'Iosevka Term 12' --prompt > --tb #000000FF --tf #FE8019FF --fb #000000FF --ff #EBDBB2FF --cb #000000FF --cf #EBDBB2FF --nb #000000FF --nf #A89983FF --ab #000000FF --af #A89983FF --hb #000000FF --hf #8EC07BFF"
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
