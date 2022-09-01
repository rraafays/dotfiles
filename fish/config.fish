if status is-interactive
	starship init fish | source
end

set -gx BAT_THEME "gruvbox-dark"

set -gx BUN_INSTALL "$HOME/.bun"
set -gx YARN_INSTALL "$HOME/.yarn"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

set -gx PATH $BUN_INSTALL/bin $YARN_INSTALL/bin $PNPM_HOME $PATH 


set fish_cursor_default     block       blink
set fish_cursor_insert       line        blink
set fish_cursor_replace_one underscore  blink
set fish_cursor_visual      block
