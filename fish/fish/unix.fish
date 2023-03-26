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

set -x BEMENU_OPTS "--fn 'Iosevka Term 12' --prompt > --tb #282828FF --tf #D65C0DFF --fb #282828FF --ff #EBDBB2FF --cb #EBDBB2FF --cf #EBDBB2FF --nb #282828FF --nf #928373FF --ab #282828FF --af #928373FF --hb #282828FF --hf #EBDBB2FF"
set -x ANDROID_HOME "$HOME/Android/Sdk"
