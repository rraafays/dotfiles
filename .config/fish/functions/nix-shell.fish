function nix-shell --description "Start an interactive shell based on a Nix expression"
    nix-your-shell fish nix-shell -- $argv
end
