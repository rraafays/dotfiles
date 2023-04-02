set FISH_HOME "$HOME/.config/fish"

source $FISH_HOME/fish/base.fish
source $FISH_HOME/fish/aliases.fish
source $FISH_HOME/fish/functions.fish
source $FISH_HOME/fish/path.fish
source $FISH_HOME/fish/credentials.fish
source $FISH_HOME/fish/ls.fish

# source platform specific scripts
switch (uname)
  case Darwin 
    source $FISH_HOME/fish/macos.fish
  case Linux
    source $FISH_HOME/fish/unix.fish
end

# pnpm
set -gx PNPM_HOME "/home/raf/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
