set fish_greeting ''

if [ "$EDITOR" != "nvim" ]; set EDITOR nvim; end # set editor to neovim
if [ "$MANPAGER" != "nvim -c 'Man! -o -" ]; set MANPAGER "nvim -c 'Man! -o -'"; end # set manpager to neovim
if [ "$TERM_PROGRAM" = "tmux" ]; set -x MODE "TMUX"; end # show that tmux is enabled for starship

set FZF_DEFAULT_COMMAND "rg --files --hidden --follow" # fzf prefs

if status is-interactive; starship init fish | source; end # drop into starship

# different prompt for root
if not fish_is_root_user; set -x STARSHIP_CONFIG "$HOME/.config/starship/default.toml"; end
if fish_is_root_user; set -x STARSHIP_CONFIG "$HOME/.config/starship/root.toml"; end

# fish vi mode
fish_vi_key_bindings 
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block
