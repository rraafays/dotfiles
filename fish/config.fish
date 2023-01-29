set fish_greeting '' # disable greeting

if [ "$EDITOR" != "nvim" ]; set -gx EDITOR nvim; end

set -gx WLR_NO_HARDWARE_CURSORS 1
set -gx GBM_BACKEND nvidia-drm
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia
set -gx LIBVA_DRIVER_NAME nvidia
set -gx __GL_GSYNC_ALLOWED 1
set -gx __GL_VRR_ALLOWED 0
set -gx LIBVA_DRIVER_NAME nvidia
set -gx XDG_SESSION_TYPE wayland
set -gx GBM_BACKEND nvidia

set -gx BEMENU_OPTS "--fn 'Iosevka Term 11' --prompt > --tb #282828FF --tf #D65C0DFF --fb #282828FF --ff #EBDBB2FF --cb #EBDBB2FF --cf #EBDBB2FF --nb #282828FF --nf #928373FF --ab #282828FF --af #928373FF --hb #282828FF --hf #EBDBB2FF"

if not fish_is_root_user # if the user is not root
  set -gx STARSHIP_CONFIG "$HOME/.config/starship/default.toml" # set starship config to default
end
if fish_is_root_user # if the user is root
  set -gx STARSHIP_CONFIG "$HOME/.config/starship/root.toml" # set the starship config to root
end

if status is-interactive # if fish is in interactive mode
	starship init fish | source # start starship
end

fish_vi_key_bindings # enable vim mode
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

# install directories
if [ "$BUN_INSTALL" != "$HOME/.bun" ]; set -gx BUN_INSTALL "$HOME/.bun"; end
if [ "$YARN_INSTALL" != "$HOME/.yarn" ]; set -gx YARN_INSTALL "$HOME/.yarn"; end
if [ "$CARGO_INSTALL" != "$HOME/.cargo" ]; set -gx CARGO_INSTALL "$HOME/.cargo"; end
if [ "$DOTNET_INSTALL" != "$HOME/.dotnet" ]; set -gx DOTNET_INSTALL "$HOME/.dotnet"; end
if [ "$GO_INSTALL" != "$HOME/go" ]; set -gx GO_INSTALL "$HOME/go"; end
if [ "$RBENV_INSTALL" != "$HOME/.rbenv" ]; set -gx RBENV_INSTALL "$HOME/.rbenv"; end
if [ "$BREW_INSTALL" != "/opt/homebrew" ]; set -gx BREW_INSTALL "/opt/homebrew"; end
if [ "$PNPM_HOME" != "$HOME/.local/share/pnpm" ]; set -gx PNPM_HOME "$HOME/.local/share/pnpm"; end

# platform specific directories
switch (uname)
  case Darwin
    set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
end
switch (uname)
  case Linux
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
end

# sets the final path variable
set -gx PATH $BUN_INSTALL/bin $YARN_INSTALL/bin  $PNPM_HOME $CARGO_INSTALL/bin $DOTNET_INSTALL/tools $BREW_INSTALL/bin $GO_INSTALL/bin $RBENV_INSTALL/bin $RBENV_INSTALL/shims $HOME/.local/bin $PATH 
