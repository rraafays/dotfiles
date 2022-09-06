function dark -d 'Set dark theme'
  set -e theme
  set -Ux theme "dark"
  kitty @ set-colors --all --configured "~/.config/kitty/gruvbox_dark.conf"
  fish "$HOME/.config/bspwm/bspwmrc"
end
