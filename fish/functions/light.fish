function light -d 'Set light theme'
  set -e theme
  set -gx theme "light"
  kitty @ set-colors --all --configured "~/.config/kitty/gruvbox_light.conf"
  fish -C "$HOME/.config/bspwm/bspwmrc"
end
