set fish_greeting '' # disable greeting

if [ "$EDITOR" != "nvim" ]; set -gx EDITOR nvim; end

if not fish_is_root_user # if the user is not root
  set -gx STARSHIP_CONFIG "$HOME/.config/starship/default.toml" # set starship config to default
end
if fish_is_root_user # if the user is root
  set -gx STARSHIP_CONFIG "$HOME/.config/starship/root.toml" # set the starship config to root
end

if status is-interactive # if fish is in interactive mode
	starship init fish | source # start starship
  if [ "$TERM_PROGRAM" != "tmux" ]; tmux -2; end # if TERM_PROGRAM is not tmux then start tmux which will also set TERM_PROGRAM to tmux
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
if [ "$BREW_INSTALL" != "/opt/homebrew" ]; set -gx BREW_INSTALL "/opt/homebrew"; end
if [ "$PNPM_HOME" != "$HOME/.local/share/pnpm" ]; set -gx PNPM_HOME "$HOME/.local/share/pnpm"; end

# sets the final path variable
set -gx PATH $BUN_INSTALL/bin $YARN_INSTALL/bin  $PNPM_HOME $CARGO_INSTALL/bin $DOTNET_INSTALL/tools $BREW_INSTALL/bin $GO_INSTALL/bin $PATH 
