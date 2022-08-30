function scrcpy --wraps='/usr/bin/scrcpy --shortcut-mod lctrl --disable-screensaver' --description 'alias for scrcpy preferences'
  /usr/bin/scrcpy --shortcut-mod lctrl --disable-screensaver $argv;
end
