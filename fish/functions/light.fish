function light -d 'Set light theme'
  set -e theme
  set -Ux theme 'light'
  kitty @ set-colors --all --configured '~/.config/kitty/gruvbox_light.conf'
  bash -c '$HOME/.config/bspwm/bspwmrc'
end
