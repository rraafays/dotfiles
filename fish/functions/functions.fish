function transmission -d 'shorten command to transmission-remote'
  transmission-remote $argv; 
end

function bat -d 'bat with gruvbox-dark theme'
  command bat --theme gruvbox-dark $argv
end

function meh -d 'feh for mac by drabweb'
  open -b "drabweb.macfeh" $argv
end

function tree -d 'tree with colour'
  command tree -C $argv
end

function vi -d 'launch neovim'
  nvim $argv
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
