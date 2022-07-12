if status is-interactive
	starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/raf/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end