if status is-interactive
	starship init fish | source
end

set -gx BAT_THEME "gruvbox-dark"
set -gx PNPM_HOME "/home/raf/.local/share/pnpm"
set -gx PATH /opt/Min $PNPM_HOME $PATH 

