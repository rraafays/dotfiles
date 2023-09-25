# base tools
function ls
  lsd $argv
end
function tree
  lsd --tree $argv
end
function tls
  tmux ls -F " - #{session_name}"
end
function trm
  tmux kill-session -t $argv
end
function fd
  command fd -u $argv
end
function vi
  nvim $argv
end
function graveyard
  z $HOME/.graveyard
end
function graves
  tree -a
end
function decompose
  rip --decompose
end
function grep
  rg $argv
end
function bat
  command bat --theme gruvbox-dark $argv
end
function ssh
  command ssh -F ~/.config/ssh/metal_gear $argv
end

# utilities
function `
  starship toggle username
  starship toggle hostname
  clear
end
function =
  starship toggle line_break
  clear
end
function qr
  qrencode -t UTF8 -m 2 $argv
end
function gitfetch
  command onefetch --true-color never --no-color-palette --no-art --no-title --text-colors 0 0 0 5 5 15
end
function onefetch
  command onefetch --true-color never
end
function py
  python3 $argv
end
function clear
  if set -q TMUX
    tmux send-keys -R
  else
    command clear
  end
end
function clean
  if set -q TMUX
    clear
    tmux clear-history
  else
    command clear
  end
end
function user-dirs-update
  mkdir "$HOME/desktop"
  mkdir "$HOME/downloads"
  mkdir "$HOME/templates"
  mkdir "$HOME/public"
  mkdir "$HOME/documents"
  mkdir "$HOME/music"
  mkdir "$HOME/pictures"
  mkdir "$HOME/videos"
  xdg-user-dirs-update
end
function cargo
  if count $argv > /dev/null
    command cargo $argv
  else
    command cargo install-update --all
  end
end

# transmission
function transmission
  transmission-remote $argv
end
function transmission-watch
  watch -n 1 "transmission-remote -l"
end
function transmission-list
  transmission-remote -l
end
function transmission-torrent
  transmission-remote -t $argv
end

# graphicals
function im
  kitty +kitten icat --align left $argv
end
function imv
  command mpv --loop --window-maximized --no-terminal --no-input-cursor $argv & disown
end
function mpv
  command mpv --no-terminal --no-input-cursor $argv & disown
end
function play
  command mpv --no-audio-display --no-input-cursor $argv
end
function thura
  zathura $argv &
end
function scrcpy
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end
