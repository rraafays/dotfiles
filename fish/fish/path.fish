if [ "$BUN_INSTALL" != "$HOME/.bun" ]; set -x BUN_INSTALL "$HOME/.bun"; end
if [ "$YARN_INSTALL" != "$HOME/.yarn" ]; set -x YARN_INSTALL "$HOME/.yarn"; end
if [ "$CARGO_INSTALL" != "$HOME/.cargo" ]; set -x CARGO_INSTALL "$HOME/.cargo"; end
if [ "$DOTNET_INSTALL" != "$HOME/.dotnet" ]; set -x DOTNET_INSTALL "$HOME/.dotnet"; end
if [ "$GO_INSTALL" != "$HOME/go" ]; set -x GO_INSTALL "$HOME/go"; end
if [ "$RBENV_INSTALL" != "$HOME/.rbenv" ]; set -x RBENV_INSTALL "$HOME/.rbenv"; end
if [ "$BREW_INSTALL" != "/opt/homebrew" ]; set -x BREW_INSTALL "/opt/homebrew"; end
if [ "$PNPM_HOME" != "$HOME/.local/share/pnpm" ]; set -x PNPM_HOME "$HOME/.local/share/pnpm"; end
if [ "$STARSHIP_HOME" != "$HOME/.config/starship" ]; set -x STARSHIP_HOME "$HOME/.config/starship/"; end

set -x PATH $BUN_INSTALL/bin $YARN_INSTALL/bin  $PNPM_HOME $CARGO_INSTALL/bin $DOTNET_INSTALL/tools $BREW_INSTALL/sbin $BREW_INSTALL/bin $GO_INSTALL/bin $RBENV_INSTALL/bin $RBENV_INSTALL/shims $HOME/.local/bin $HOME/.config/fish/scripts $PATH 
