function transmission --wraps='transmission-remote' --description 'transmission=transmission-remote'
  transmission-remote $argv; 
end

function bat -d 'Calls bat with arguments'
  command bat --theme gruvbox-dark $argv
end

function meh --wraps='open -b "drabweb.macfeh"' --description 'alias meh=open -b "drabweb.macfeh"'
  open -b "drabweb.macfeh" $argv; 
end

function tree --wraps='command tree -C -L 2' --description 'tree=command tree -C -L 2'
  command tree -C $argv; 
end

function vi --wraps='nvim' --description 'vi=nvim'
  nvim $argv; 
end

function onefetch --wraps='command onefetch --true-color never' --description 'onefetch=command onefetch --true-color never'
  command onefetch --true-color never;
end

function scrcpy --wraps='scrcpy --shortcut-mod lctrl --disable-screensaver' --description 'alias for scrcpy preferences'
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv;
end

function py -d 'py=python3'
  python3
end
