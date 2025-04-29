if status is-interactive
    fish_vi_key_bindings

    bind --mode default \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode insert \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode paste \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode replace \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode replace_one \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode visual \cZ 'fg 2>/dev/null; commandline -f repaint'

    bind --mode default - 'if test (pwd) = $PREVIOUS_DIR; 
                               cd -; 
                               commandline -f repaint;
                           else; 
                               cd $PREVIOUS_DIR; 
                               commandline -f repaint; 
                           end;'

    if [ -x "$(command -v tmux)" ] && [ -z "$TMUX" ] && not test -z "$DISPLAY"
        exec tmux new-session -A -c ~/ -s main >/dev/null 2>&1
    end
    if not test -z $SSH_TTY
        exec tmux new-session -A -c ~/ -s main >/dev/null 2>&1
    end

    if not fish_is_root_user
        cat \
            "$HOME/.config/starship/base.toml" \
            "$HOME/.config/starship/user.toml" >"$HOME/.config/starship/.user"
        set -x STARSHIP_CONFIG "$HOME/.config/starship/.user"
    end
    if fish_is_root_user
        cat \
            "$HOME/.config/starship/base.toml" \
            "$HOME/.config/starship/root.toml" >"$HOME/.config/starship/.root"
        set -x STARSHIP_CONFIG "$HOME/.config/starship/.root"
    end

    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source
end
