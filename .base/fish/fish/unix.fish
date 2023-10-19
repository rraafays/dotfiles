set -x ANDROID_HOME "$HOME/Android/Sdk"

if status --is-interactive
  set -x MANPAGER "nvim -c 'Man! -o -'"

  if not test -e "$HOME/.config/kitty/kitty.conf"
    cat                                   \
      "$HOME/.config/kitty/base.conf"     \
      "$HOME/.config/kitty/unix.conf"     \
    > "$HOME/.config/kitty/kitty.conf"
  end

  function hypr
    dbus-run-session Hyprland
  end
  function emerge
    if not fish_is_root_user
      if count $argv > /dev/null
        command emerge $argv
      else
        doas emerge --sync --verbose
        doas emerge --verbose --update --deep --newuse @world
        doas emerge --depclean
      end
    else
      if count $argv > /dev/null
        command emerge $argv
      else
        emerge --sync --verbose
        emerge --verbose --update --deep --newuse @world
        emerge --depclean
      end
    end
  end
  function idea
    idea-community $argv
  end
end
