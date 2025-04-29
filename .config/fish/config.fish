source $FISH_HOME/src/path.fish
source $FISH_HOME/src/base.fish
source $FISH_HOME/src/credentials.fish

switch (uname)
    case Darwin
        if test -e /etc/nix-darwin
            source $FISH_HOME/src/nix-darwin.fish
        end
    case Linux
        source $FISH_HOME/src/unix.fish
        if test -e /etc/nixos
            source $FISH_HOME/src/nixos.fish
        end
end
