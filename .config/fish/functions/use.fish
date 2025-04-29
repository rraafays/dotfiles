function use
    switch "$argv[1]"
        case nix
            echo "use nix" >.envrc
            direnv allow
        case flake
            echo "use flake" >.envrc
            direnv allow
        case '*'
            return 1
    end
end
