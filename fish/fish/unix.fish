if [ "$MANPAGER" != "nvim -c 'Man! -o -'" ]
  set MANPAGER "nvim -c 'Man! -o -'"
end

set -x BEMENU_OPTS "--fn 'Iosevka Term 12' --prompt > --tb #000000FF --tf #EA2300FF --fb #000000FF --ff #FAFFB2FF --cb #FAFFB2FF --cf #FAFFB2FF --nb #000000FF --nf #F2F2C4FF --ab #000000FF --af #F2F2C4FF --hb #000000FF --hf #FAFFB2FF"
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
