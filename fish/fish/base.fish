set fish_greeting ''

if [ "$EDITOR" != "nvim" ]; set EDITOR nvim; end # set editor to neovim
set FZF_DEFAULT_COMMAND "rg --files --hidden --follow" # fzf prefs

if status is-interactive; starship init fish | source; end # drop into starship

# different prompt for root
if not fish_is_root_user; 
  cat "$HOME/.config/starship/base.toml" "$HOME/.config/starship/user.toml" > "$HOME/.config/starship/.user"
  set -x STARSHIP_CONFIG "$HOME/.config/starship/.user"
end

if fish_is_root_user; 
  cat "$HOME/.config/starship/base.toml" "$HOME/.config/starship/root.toml" > "$HOME/.config/starship/.root"
  set -x STARSHIP_CONFIG "$HOME/.config/starship/.root"
end

# fish vi mode
fish_vi_key_bindings 
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block
