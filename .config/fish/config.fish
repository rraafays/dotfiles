if status is-interactive

    set -x PATH \
        /run/current-system/sw/bin \
        $BUN_INSTALL/bin \
        $YARN_INSTALL/bin \
        $PNPM_HOME \
        $CARGO_INSTALL/bin \
        $DOTNET_INSTALL/tools \
        $BREW_INSTALL/sbin \
        $BREW_INSTALL/bin \
        $GO_INSTALL/bin \
        $RBENV_INSTALL/bin \
        $RBENV_INSTALL/shims \
        $HOME/.local/bin \
        $USER_HOME/bin \
        $INTELLIJ_HOME \
        $SQLPATH \
        $SCRIPTS_HOME \
        $XMLFORMAT_CONF \
        $PATH

    fish_vi_key_bindings

    bind --mode default \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode insert \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode paste \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode replace \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode replace_one \cZ 'fg 2>/dev/null; commandline -f repaint'
    bind --mode visual \cZ 'fg 2>/dev/null; commandline -f repaint'

    bind --mode default \cf 'commandline -a " (fzf)"'
    bind --mode insert \cf 'commandline -a " (fzf)"'
    bind --mode paste \cf 'commandline -a " (fzf)"'
    bind --mode replace \cf 'commandline -a " (fzf)"'
    bind --mode replace_one \cf 'commandline -a " (fzf)"'
    bind --mode visual \cf 'commandline -a " (fzf)"'

    bind --mode default - 'if test (pwd) = $PREVIOUS_DIR; 
                               cd -; 
                               commandline -f repaint;
                           else; 
                               cd $PREVIOUS_DIR; 
                               exec fish
                           end;'

    if command -q tmux && test -z "$TMUX" && test -n "$DISPLAY" || test -n "$SSH_TTY"
        exec tmux new-session -A -c ~/ -s main >/dev/null 2>&1
    end

    set -l config_dir "$HOME/.config/starship"
    if fish_is_root_user
        set -l target "$config_dir/.root"
        set -l base "$config_dir/base.toml"
        set -l role "$config_dir/root.toml"

        if test ! -e "$target" -o "$base" -nt "$target" -o "$role" -nt "$target"
            cat "$base" "$role" >"$target"
        end
        set -x STARSHIP_CONFIG "$target"
    else
        set -l target "$config_dir/.user"
        set -l base "$config_dir/base.toml"
        set -l role "$config_dir/user.toml"

        if test ! -e "$target" -o "$base" -nt "$target" -o "$role" -nt "$target"
            cat "$base" "$role" >"$target"
        end
        set -x STARSHIP_CONFIG "$target"
    end

    set -l os (uname)

    if test "$os" = Darwin
        if test -e /etc/nix-darwin
            source $FISH_HOME/src/nix-darwin.fish
        end
    else if test "$os" = Linux
        source $FISH_HOME/src/unix.fish
        if test -e /etc/nixos
            source $FISH_HOME/src/nixos.fish
        end
    end

    source $FISH_HOME/src/credentials.fish
    source $FISH_HOME/src/direnv.fish
    source $FISH_HOME/src/zoxide.fish
    source $FISH_HOME/src/starship.fish
end
