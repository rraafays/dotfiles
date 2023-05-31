if [ "$MANPAGER" != "nvim -c 'Man! -o -'" ]; set MANPAGER "nvim -c 'Man! -o -'"; end

set -x WLR_NO_HARDWARE_CURSORS 1
set -x GBM_BACKEND nvidia-drm
set -x __GLX_VENDOR_LIBRARY_NAME nvidia
set -x LIBVA_DRIVER_NAME nvidia
set -x __GL_GSYNC_ALLOWED 1
set -x __GL_VRR_ALLOWED 0
set -x LIBVA_DRIVER_NAME nvidia
set -x XDG_SESSION_TYPE wayland
set -x GBM_BACKEND nvidia

set -x BEMENU_OPTS "--fn 'Iosevka Term 12' --prompt > --tb #000000FF --tf #D65C0DFF --fb #000000FF --ff #EBDBB2FF --cb #EBDBB2FF --cf #EBDBB2FF --nb #000000FF --nf #928373FF --ab #000000FF --af #928373FF --hb #000000FF --hf #EBDBB2FF"
set -x ANDROID_HOME "$HOME/Android/Sdk"

function hypr -d 'launch hyprland'; Hyprland; end
