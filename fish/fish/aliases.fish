# replacements
if type -q rg
    function grep -d 'replace grep with ripgrep'
        rg $argv
    end
else if type -q grep
    function grep -d 'command'
        echo -e '\033[1;33minstall ripgrep!\033[0m'
        command grep $argv
    end
end
if type -q lsd
    function ls -d 'replace ls with lsd'
        lsd $argv
    end
    function tree -d 'tree using lsd'
        lsd --tree $argv
    end
else if type -q ls
    function ls -d 'command'
        echo -e '\033[1;33minstall lsd!\033[0m'
        command ls $argv
    end
end
if type -q fastfetch
    function neofetch -d 'command'
        fastfetch $argv
    end
else if type -q neofetch
    function neofetch -d 'command'
        echo -e '\033[1;33minstall fastfetch!\033[0m'
        command neofetch $argv
    end
end

# rm -> rip
if type -q rip
    function graveyard -d 'visit the graveyard'
        z $HOME/.graveyard
    end
    function graves -d 'view graves'
        tree -a $HOME/.graveyard
    end
    function decompose -d 'decompose the graveyard'
        rip --decompose
    end
end

# shorthands
if type -q python3
    function py -d 'launch python3'
        python3 $argv
    end
end
if type -q qrencode
    function qr -d 'quickly generate qrcode'
        qrencode -t UTF8 -m 2 $argv
    end
end
if type -q zathura
    function za -d 'launch zathura'
        zathura $argv &
    end
end
if type -q nvim
    function vi -d 'launch neovim'
        nvim $argv
    end
end
if type -q transmission-remote
    function t -d 'shorthand transmission-remote'
        transmission-remote $argv
    end
    function td -d 'shorthand transmission-daemon'
        transmission-daemon $argv
    end
    function tv -d 'watch transmissions'
        watch -n 1 transmission-remote -l
    end
end

# media tools
if type -q mpv
    function mpv -d 'mpv as image viewer'
        command mpv --no-terminal $argv &
    end
    function imv -d 'mpv as image viewer'
        command mpv --loop --window-maximized --no-terminal $argv &
    end
    function play -d 'mpv as audio player'
        command mpv --no-audio-display $argv
    end
end
if type -q kitty
    function icat -d 'image in kitty'
        kitty +kitten icat --align left $argv
    end
end

# preference flags
if type -q bat
    function bat -d 'command'
        command bat --theme gruvbox-dark $argv
    end
end
if type -q scrcpy
    function scrcpy -d 'command'
        command scrcpy --shortcut-mod lctrl --disable-screensaver $argv
    end
end
if type -q fzf
    function fzf -d 'command'
        command fzf --color=16
    end
end
if type -q duf
    function duf -d 'command'
        command duf -theme ansi $argv
    end
end
if type -q onefetch
    function onefetch -d 'command'
        command onefetch --true-color never --no-color-palette --no-art --no-title
    end
end
