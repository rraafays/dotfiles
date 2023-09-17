# base tools
function ls -d "replace ls with lsd"
  lsd $argv
end
function tree -d "directory tree using lsd"
  lsd --tree $argv
end
function tls -d "list sessions"
  tmux ls -F " - #{session_name}"
end
function trm -d "remove session"
  tmux kill-session -t $argv
end
function fd -d "find anything"
  command fd -u $argv
end
function vi -d "shorthand nvim"
  nvim $argv
end
function graveyard -d "visit the graveyard"
  z $HOME/.graveyard
end
function graves -d "view graves"
  tree -a -d $HOME/.graveyard
end
function decompose -d "decompose files in the graveyard"
  rip --decompose
end
function grep -d "replace grep with ripgrep"
  rg $argv
end
function bat -d "pretty cat"
  command bat --theme gruvbox-dark $argv
end
function ssh -d "source metal gear configurations"
  command ssh -F ~/.config/ssh/metal_gear $argv
end

# utilities
function ` -d "toggle name"
  starship toggle username
  starship toggle hostname
  clear
end
function = -d "toggle line break"
  starship toggle line_break
  clear
end
function qr -d "quickly generate qrcode"
  qrencode -t UTF8 -m 2 $argv
end
function firefetch -d "fire nation fetch"
  echo
  neofetch --ascii ~/.config/ascii/fire_nation_neofetch --ascii_colors 9 firefetch --colors 9 9 11 9 11 7 $argv
end
function gitfetch -d "minimal onefetch"
  command onefetch --true-color never --no-color-palette --no-art --no-title --text-colors 0 0 0 5 5 15
end
function onefetch -d "minimal onefetch"
  command onefetch --true-color never
end
function py -d "shorthand python3"
  python3 $argv
end
function clear -d "clear terminal"
  if set -q TMUX
    tmux send-keys -R
  else
    command clear
  end
end
function clean -d "clean terminal"
  if set -q TMUX
    clear
    tmux clear-history
  else
    command clear
  end
end
function user-dirs-update -d "generate user dirs"
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
function visudo -d "edit sudoers file"
  command sudo EDITOR=nvim visudo $argv
end

# transmission
function transmission -d "transmission-remote"
  transmission-remote $argv
end
function transmission-watch -d "watch transmissions"
  watch -n 1 "transmission-remote -l"
end
function transmission-list -d "list transmissions"
  transmission-remote -l
end
function transmission-torrent -d "control transmission"
  transmission-remote -t $argv
end

# graphicals
function im -d "image in kitty"
  kitty +kitten icat --align left $argv
end
function imv -d "mpv as image viewer"
  command mpv --loop --window-maximized --no-terminal --no-input-cursor $argv & disown
end
function mpv -d "mpv as video player"
  command mpv --no-terminal --no-input-cursor $argv & disown
end
function play -d "mpv as audio player"
  command mpv --no-audio-display --no-input-cursor $argv
end
function thura -d "launch zathura in background"
  zathura $argv &
end
function scrcpy -d "scrcpy with prefs"
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end
