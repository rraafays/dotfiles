# replacements
function grep -d 'replace grep with ripgrep'; rg $argv; end
function ls -d 'replace ls with lsd'; lsd $argv; end
function tree -d 'tree using lsd'; lsd --tree $argv; end
function neofetch -d 'command'; flashfetch; end

# rm -> rip
function graveyard -d 'visit the graveyard'; z $HOME/.graveyard; end
function graves -d 'view graves'; tree -a $HOME/.graveyard; end
function decompose -d 'decompose the graveyard'; rip --decompose; end

# shorthands
function py -d 'launch python3'; python3 $argv; end
function qr -d 'quickly generate qrcode'; qrencode -t UTF8 -m 2 $argv; end
function za -d 'launch zathura'; zathura $argv &; end
function vi -d 'launch neovim'; nvim $argv; end
function t -d 'shorthand transmission-remote'; transmission-remote $argv; end
function td -d 'shorthand transmission-daemon'; transmission-daemon $argv; end
function tv -d 'watch transmissions'; watch -n 1 transmission-remote -l; end

# media tools
function mpv -d 'mpv as image viewer'; command mpv --no-terminal $argv &; end
function imv -d 'mpv as image viewer'; command mpv --loop --window-maximized --no-terminal $argv &; end
function icat -d 'image in kitty'; kitty +kitten icat --align left $argv; end
function play -d 'mpv as audio player'; command mpv --no-audio-display $argv; end

# preference flags
function bat -d 'command'; command bat --theme gruvbox-dark $argv; end
function onefetch -d 'command'; command onefetch --true-color never; end
function scrcpy -d 'command'; command scrcpy --shortcut-mod lctrl --disable-screensaver $argv; end
function fzf -d 'command'; command fzf --color=16; end
function duf -d 'command'; command duf -theme ansi $argv; end
