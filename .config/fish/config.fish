set FISH_HOME "$HOME/.config/fish"

source $FISH_HOME/src/path.fish
source $FISH_HOME/src/base.fish
source $FISH_HOME/src/aliases.fish
source $FISH_HOME/src/functions.fish
source $FISH_HOME/src/credentials.fish
source $FISH_HOME/src/ls.fish
source $FISH_HOME/src/toolset.fish

switch (uname)
    case Darwin
        source $FISH_HOME/src/macos.fish
        if test -e /etc/nix-darwin
            source $FISH_HOME/src/nix-darwin.fish
        end
    case Linux
        source $FISH_HOME/src/unix.fish
        if test -e /etc/nixos
            source $FISH_HOME/src/nixos.fish
        end
end
