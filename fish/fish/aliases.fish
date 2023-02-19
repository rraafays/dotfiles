# various vi related aliases
function vi -d 'launch neovim'; nvim $argv; end
function ai -d 'launch chatgpt'; nvim -c 'ChatGPT'; end
function fi -d 'launch telescope find'; nvim -c 'Telescope find_files'; end
function gi -d 'launch telescope live grep'; nvim -c 'Telescope live_grep'; end

# shorthand transmission and transmission-daemon
function t -d 'shorthand transmission-remote'; transmission-remote $argv; end
function td -d 'shorthand transmission-daemon'; transmission-daemon $argv; end

# shorthand python3
function py -d 'launch python3'; python3 $argv; end

# shorthand qrencode
function qr -d 'quickly generate qrcode'; qrencode -t UTF8 -m 2 $argv; end

# preferences as flags
function bat -d 'command'; command bat --theme gruvbox-dark $argv; end
function onefetch -d 'command'; command onefetch --true-color never; end
function scrcpy -d 'command'; command scrcpy --shortcut-mod lctrl --disable-screensaver $argv; end
function fzf -d 'command'; command fzf --color=16; end
function duf -d 'command'; command duf -theme ansi $argv; end

# unix modernisations
function grep -d 'replace grep with ripgrep'; rg $argv; end
function ls -d 'replace ls with lsd'; lsd $argv; end
function tree -d 'tree using lsd'; lsd --tree $argv; end
