function scrcpy --wraps='scrcpy --shortcut-mod lctrl --disable-screensaver' --description 'alias for scrcpy preferences'
  command scrcpy --shortcut-mod lctrl --disable-screensaver $argv;
end
