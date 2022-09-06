function dark -d 'Set dark theme'
  set -e theme
  set -gx theme "dark"
  kitty @ set-colors --all --configured "~/.config/kitty/gruvbox_dark.conf"
  fish -C "$HOME/.config/bspwm/bspwmrc" 
end
