function t -d 'shorthand transmission-remote'
  transmission-remote $argv; 
end

function td -d 'shorthand transmission-daemon'
  transmission-daemon $argv; 
end

function bat -d 'bat with gruvbox-dark theme'
  command bat --theme gruvbox-dark $argv
end

function meh -d 'feh for mac by drabweb'
  open -b "drabweb.macfeh" $argv
end

function vi -d 'launch neovim'
  nvim $argv
end

function ai -d 'launch chatgpt'
  nvim -c 'ChatGPT'
end

function fi -d 'launch telescope find'
  nvim -c 'Telescope find_files'
end

function gi -d 'launch telescope live grep'
  nvim -c 'Telescope live_grep'
end

function onefetch -d 'onefetch withouut true colour'
  command onefetch --true-color never
end

function scrcpy -d 'scrcpy with mod set to left control and with screen timeout disabled'
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
end

function py -d 'launch python3'
  python3 $argv
end

function startx -d 'warn that you can\t start X while tmux is running'
  if [ "$TERM_PROGRAM" = "tmux" ]; echo "you must exit tmux first!"; end
  if [ "$TERM_PROGRAM" != "tmux" ]; command startx; end
end

function fzf -d 'launch fzf'
  command fzf --color=16
end

function qr -d 'quickly generate qrcode'
  qrencode -t UTF8 -m 2 $argv
end

function ls -d 'replace ls with lsd'
  lsd $argv
end

function tree -d 'tree using lsd'
  lsd --tree $argv
end
