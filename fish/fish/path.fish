set -x BUN_INSTALL "$HOME/.bun";
set -x YARN_INSTALL "$HOME/.yarn";
set -x CARGO_INSTALL "$HOME/.cargo";
set -x DOTNET_INSTALL "$HOME/.dotnet";
set -x GO_INSTALL "$HOME/go";
set -x RBENV_INSTALL "$HOME/.rbenv";
set -x BREW_INSTALL "/opt/homebrew";
set -x PNPM_HOME "$HOME/.local/share/pnpm";
set -x USER_HOME "/Users/$USER";

set -x PATH                         \
    $BUN_INSTALL/bin                \
    $YARN_INSTALL/bin               \
    $PNPM_HOME                      \
    $CARGO_INSTALL/bin              \
    $DOTNET_INSTALL/tools           \
    $BREW_INSTALL/sbin              \
    $BREW_INSTALL/bin               \
    $GO_INSTALL/bin                 \
    $RBENV_INSTALL/bin              \
    $RBENV_INSTALL/shims            \
    $HOME/.local/bin                \
    $HOME/.config/fish/scripts      \
    $USER_HOME/bin                  \
    $PATH 
