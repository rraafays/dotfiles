set -x BUN_INSTALL "$HOME/.bun"
set -x YARN_INSTALL "$HOME/.yarn"
set -x CARGO_INSTALL "$HOME/.cargo"
set -x DOTNET_INSTALL "$HOME/.dotnet"
set -x GO_INSTALL "$HOME/go"
set -x RBENV_INSTALL "$HOME/.rbenv"
set -x BREW_INSTALL /opt/homebrew
set -x PNPM_HOME "$HOME/.local/share/pnpm"
set -x USER_HOME "/Users/$USER"
set -x INTELLIJ_HOME "/Applications/IntelliJ IDEA.app/Contents/MacOS"
set -x SQLCL_HOME "/opt/homebrew/Caskroom/sqlcl/23.3.0.270.1251/sqlcl"
set -x SQLPATH "$HOME/.config/sqlcl"
set -x SCRIPTS_HOME "$FISH_HOME/scripts"
set -x AVR_GCC "/opt/homebrew/opt/avr-gcc@8/"
set -x ARM_EABI_BINUTILS /opt/homebrew/opt/arm-none-eabi-binutils/
set -x XMLFORMAT_CONF "$HOME/.config/lvim/formatters/xmlformat.conf"

set -x PATH \
    $BUN_INSTALL/bin \
    $YARN_INSTALL/bin \
    $PNPM_HOME \
    $CARGO_INSTALL/bin \
    $DOTNET_INSTALL/tools \
    $BREW_INSTALL/sbin \
    $BREW_INSTALL/bin \
    $GO_INSTALL/bin \
    $RBENV_INSTALL/bin \
    $RBENV_INSTALL/shims \
    $HOME/.local/bin \
    $USER_HOME/bin \
    $INTELLIJ_HOME \
    $SQLCL_HOME/bin \
    $SQLPATH \
    $SCRIPTS_HOME \
    $AVR_GCC \
    $ARM_EABI_BINUTILS \
    $XMLFORMAT_CONF \
    $PATH
