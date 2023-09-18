set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow"
set -x FZF_DEFAULT_OPTS "--color="16,bg+:#000000""
set -x GRAVEYARD "$HOME/.graveyard"
set -x ELINKS_CONFDIR "$HOME/.config/elinks"
set -x SUDO_PROMPT "$(tput setaf 9 bold)> $(tput sgr0)"

if status is-interactive;
  starship init fish | source
  zoxide init fish | source

  function fish_greeting
    proverb
  end

  if not fish_is_root_user;
    if not test -z $DISPLAY
      cat                                       \
        "$HOME/.config/starship/base.toml"      \
        "$HOME/.config/starship/user.toml"      \
      > "$HOME/.config/starship/.user"
    else
      cat                                       \
        "$HOME/.config/starship/tty.toml"       \
        "$HOME/.config/starship/user.toml"      \
      > "$HOME/.config/starship/.user"
    end
    set -x STARSHIP_CONFIG "$HOME/.config/starship/.user"
  end

  if fish_is_root_user;
    if not test -z $DISPLAY
      cat                                       \
        "$HOME/.config/starship/base.toml"      \
        "$HOME/.config/starship/root.toml"      \
      > "$HOME/.config/starship/.root"
    else
      cat                                         \
          "$HOME/.config/starship/tty.toml"       \
          "$HOME/.config/starship/root.toml"      \
      >   "$HOME/.config/starship/.root"
    end
    set -x STARSHIP_CONFIG "$HOME/.config/starship/.root"
  end

  if [ -x "$(command -v tmux)" ] && [ -z "$TMUX" ] && not test -z "$DISPLAY"
      exec tmux new-session -A -s (hostname -s) >/dev/null 2>&1
  end

  fish_vi_key_bindings
  set fish_cursor_default block blink
  set fish_cursor_insert line blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual block

  set --universal fish_color_autosuggestion brblack
  set --universal fish_color_command        brcyan
  set --universal fish_color_comment        brblack
  set --universal fish_color_cwd            blue
  set --universal fish_color_end            yellow
  set --universal fish_color_error          brred
  set --universal fish_color_escape         brmagenta
  set --universal fish_color_match          red
  set --universal fish_color_normal         white
  set --universal fish_color_operator       bryellow --bold
  set --universal fish_color_param          brwhite
  set --universal fish_color_quote          brgreen
  set --universal fish_color_redirection    brmagenta
  set --universal fish_color_search_match   yellow
  set --universal fish_color_selection      brwhite --bold
end
