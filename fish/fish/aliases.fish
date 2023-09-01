# replacements
function grep -d 'replace grep with ripgrep'
  rg $argv
end
function ls -d 'replace ls with lsd'
  lsd $argv
end
function tree -d 'directory tree using lsd'
  lsd --tree $argv
end

# rm -> rip
function graveyard -d 'visit the graveyard'
  z $HOME/.graveyard
end
function graves -d 'view graves'
  tree -a -d $HOME/.graveyard
end
function decompose -d 'decompose files in the graveyard'
  rip --decompose
end

# shorthands
function py -d 'shorthand python3'
  python3 $argv
end
function qr -d 'quickly generate qrcode'
  qrencode -t UTF8 -m 2 $argv
end
function za -d 'launch zathura in background'
  zathura $argv &
end
function vi -d 'shorthand nvim'
  nvim $argv
end
function t -d 'shorthand transmission-remote'
  transmission-remote $argv
end
function td -d 'shorthand transmission-daemon'
  transmission-daemon $argv
end
function tv -d 'watch transmissions'
  watch -n 1 transmission-remote -l
end
function tl -d 'list transmissions'
  transmission-remote -l
end
function tt -d 'control transmission'
  transmission-remote -t $argv
end

# media tools
function imv -d 'mpv as image viewer'
  command mpv --loop --window-maximized --no-terminal --no-input-cursor $argv & disown
end
function mpv -d 'mpv as video player'
  command mpv --no-terminal --no-input-cursor $argv & disown
end
function play -d 'mpv as audio player'
  command mpv --no-audio-display --no-input-cursor $argv
end
function icat -d 'image in kitty'
  kitty +kitten icat --align left $argv
end

# preference flags
function bat -d 'pretty cat'
  command bat --theme gruvbox-dark $argv
end
function scrcpy -d 'scrcpy with prefs'
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end
function duf -d '16 color duf'
  command duf -theme ansi $argv
end
function gitfetch -d 'minimal onefetch'
  command onefetch --true-color never --no-color-palette --no-art --no-title --text-colors 0 0 0 5 5 15
end
function user-dirs-update -d 'generate user dirs'
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

# prompt toggles
function ` -d 'toggle name'
  starship toggle username
  starship toggle hostname
  clear
end
function = -d 'toggle line break'
  starship toggle line_break
  clear
end
