if status is-interactive
	starship init fish | source
end

set -gx BAT_THEME "gruvbox-dark"
set -gx PNPM_HOME "/home/raf/.local/share/pnpm"
set -gx YARN_HOME "/home/raf/.yarn/bin"
set -gx PATH /opt/Min $YARN_HOME $PNPM_HOME $PATH 

