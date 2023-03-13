function meh -d 'feh for mac by drabweb'; open -b "drabweb.macfeh" $argv; end # feh-like alternative for mac
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
function man -d 'man'; command man -P 'nvim -c \'Man! -o -\'' $argv; end
function brew-upgrade -d 'greedy brew'; brew upgrade --greedy; end
