set fish_greeting ''

if [ "$EDITOR" != "nvim" ]; set EDITOR nvim; end # set editor to neovim
set FZF_DEFAULT_COMMAND "rg --files --hidden --follow" # fzf prefs

if status is-interactive; starship init fish | source; end # drop into starship

# different prompt for root
if not fish_is_root_user; 
  cat "$STARSHIP_HOME/base.toml" "$STARSHIP_HOME/user.toml" > "$STARSHIP_HOME/.user"
  set -x STARSHIP_CONFIG "$STARSHIP_HOME/.user"
end

if fish_is_root_user; 
  cat "$STARSHIP_HOME/base.toml" "$STARSHIP_HOME/root.toml" > "$STARSHIP_HOME/.root"
  set -x STARSHIP_CONFIG "$STARSHIP_HOME/.root"
end

# fish vi mode
fish_vi_key_bindings 
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block
