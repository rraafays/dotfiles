function meh -d 'feh for mac by drabweb'; open -b "drabweb.macfeh" $argv; end # feh-like alternative for mac
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x FrameworkPathOverride "$HOME/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono"
function man -d 'man'; command man -P 'nvim -c \'Man! -o -\'' $argv; end
