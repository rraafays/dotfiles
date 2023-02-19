set FISH_HOME "$HOME/.config/fish"

source $FISH_HOME/fish/base.fish
source $FISH_HOME/fish/aliases.fish
source $FISH_HOME/fish/keys.fish
source $FISH_HOME/fish/path.fish

# source platform specific scripts
switch (uname)
  case Darwin 
    source $FISH_HOME/fish/macos.fish
  case Linux
    source $FISH_HOME/fish/unix.fish
end
