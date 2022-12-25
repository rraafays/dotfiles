set fish_greeting '' # disable greeting

if status is-interactive # if fish is in interactive mode
	starship init fish | source # start starship
  if [ "$TERM_PROGRAM" != "tmux" ]; tmux; end # if TERM_PROGRAM is not tmux then start tmux which will also set TERM_PROGRAM to tmux
end

fish_vi_key_bindings # enable vim mode
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

# install directories
set -gx BUN_INSTALL "$HOME/.bun"
set -gx YARN_INSTALL "$HOME/.yarn"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx CARGO_INSTALL "$HOME/.cargo"
set -gx DOTNET_INSTALL "$HOME/.dotnet"
set -gx BREW_INSTALL "/opt/homebrew"

# sets the final path variable
set -gx PATH $BUN_INSTALL/bin $YARN_INSTALL/bin  $PNPM_HOME $CARGO_INSTALL/bin $DOTNET_INSTALL/tools $BREW_INSTALL/bin $PATH 
