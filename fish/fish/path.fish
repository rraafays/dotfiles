if [ "$BUN_INSTALL" != "$HOME/.bun" ]; set BUN_INSTALL "$HOME/.bun"; end
if [ "$YARN_INSTALL" != "$HOME/.yarn" ]; set YARN_INSTALL "$HOME/.yarn"; end
if [ "$CARGO_INSTALL" != "$HOME/.cargo" ]; set CARGO_INSTALL "$HOME/.cargo"; end
if [ "$DOTNET_INSTALL" != "$HOME/.dotnet" ]; set DOTNET_INSTALL "$HOME/.dotnet"; end
if [ "$GO_INSTALL" != "$HOME/go" ]; set GO_INSTALL "$HOME/go"; end
if [ "$RBENV_INSTALL" != "$HOME/.rbenv" ]; set RBENV_INSTALL "$HOME/.rbenv"; end
if [ "$BREW_INSTALL" != "/opt/homebrew" ]; set BREW_INSTALL "/opt/homebrew"; end
if [ "$PNPM_HOME" != "$HOME/.local/share/pnpm" ]; set PNPM_HOME "$HOME/.local/share/pnpm"; end

set PATH $BUN_INSTALL/bin $YARN_INSTALL/bin  $PNPM_HOME $CARGO_INSTALL/bin $DOTNET_INSTALL/tools $BREW_INSTALL/bin $GO_INSTALL/bin $RBENV_INSTALL/bin $RBENV_INSTALL/shims $HOME/.local/bin $PATH 
