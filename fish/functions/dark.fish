function dark -d 'Set dark theme'
  set -xU theme 'dark'
  kitty @ set-colors --all --configured '~/.config/kitty/gruvbox_dark.conf'
  bash -c '$HOME/.config/bspwm/bspwmrc' 
end
