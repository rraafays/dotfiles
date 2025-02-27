set -x EDITOR nvim
set -x PLANNER fasole
set -x GH_CONFIG_DIR "$HOME/.config/gh"
set -x DETOX_SEQUENCE lower
set -x DIRENV_WARN_TIMEOUT 60s
set -x NIXPKGS_ALLOW_UNFREE 1
set -x NEWT_COLORS "
    root=white,black 
    window=green,black 
    border=white,black 
    title=red,black 
    button=cyan,black 
    actbutton=white,black 
    entry=blue,white 
    label=magenta,black 
    checkbox=red,black 
    actcheckbox=green,black 
    compactbutton=yellow,black 
    textbox=cyan,black 
    acttextbox=white,black 
    listbox=white,black 
    actlistbox=white,black 
    emptyscale=red,black 
    fullscale=green,black
"

if status is-interactive
    if [ -x "$(command -v tmux)" ] && [ -z "$TMUX" ] && not test -z "$DISPLAY"
        exec tmux new-session -A -c ~/ -s main >/dev/null 2>&1
    end
    if not test -z $SSH_TTY
        exec tmux new-session -A -c ~/ -s main >/dev/null 2>&1
    end

    set fish_greeting ""

    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source

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

    set fish_cursor_default block blink
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_replace underscore blink
    set fish_cursor_visual block

    set --universal fish_color_autosuggestion brblack
    set --universal fish_color_command brcyan
    set --universal fish_color_comment brblack
    set --universal fish_color_cwd blue
    set --universal fish_color_end yellow
    set --universal fish_color_error brred
    set --universal fish_color_escape brmagenta
    set --universal fish_color_match red
    set --universal fish_color_operator bryellow --bold
    set --universal fish_color_param brwhite
    set --universal fish_color_quote brgreen
    set --universal fish_color_redirection brmagenta
    set --universal fish_color_search_match yellow
    set --universal fish_color_selection --background=2A1300 D65D0E
end
