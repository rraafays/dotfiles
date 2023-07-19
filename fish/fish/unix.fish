if [ "$MANPAGER" != "nvim -c 'Man! -o -'" ]; set MANPAGER "nvim -c 'Man! -o -'"; end

set -x BEMENU_OPTS "--fn 'Iosevka Term 12' --prompt > --tb #000000FF --tf #D65C0DFF --fb #000000FF --ff #EBDBB2FF --cb #EBDBB2FF --cf #EBDBB2FF --nb #000000FF --nf #928373FF --ab #000000FF --af #928373FF --hb #000000FF --hf #EBDBB2FF"
set -x ANDROID_HOME "$HOME/Android/Sdk"

function hypr -d 'launch hyprland'
    Hyprland
end

if not test -e "$HOME/.config/kitty/kitty.conf"
    cat                                     \
        "$HOME/.config/kitty/base.conf"     \
        "$HOME/.config/kitty/unix.conf"     \
    >   "$HOME/.config/kitty/kitty.conf"      
end
