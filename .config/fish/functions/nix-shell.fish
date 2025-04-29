function nix-shell --description "Start an interactive shell based on a Nix expression"
    command nix-shell --run fish -- $argv
end
