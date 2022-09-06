# starship prompt
if status is-interactive
	starship init fish | source
end

# directories to add to path
set -gx BUN_INSTALL "$HOME/.bun"
set -gx YARN_INSTALL "$HOME/.yarn"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

# sets the final path variable
set -gx PATH $BUN_INSTALL/bin $YARN_INSTALL/bin $PNPM_HOME $PATH 

# various fish preferences
fish_vi_key_bindings
set fish_cursor_default     block       blink
set fish_cursor_insert      line        blink
set fish_cursor_replace_one underscore  blink
set fish_cursor_visual      block
set fish_greeting           ''

if string match -q "xterm-kitty" $TERM
  kitty @ set-colors --all --configured "~/.config/kitty/gruvbox_$theme.conf"
end
