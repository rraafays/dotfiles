{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        homebrew = {
          enable = true;
          casks = [
      "nikitabobko/tap/aerospace"
            "kitty"
            "karabiner-elements"
            "firefox"
            "raycast"
            "cursorcerer"
            "docker"
          ];
        };

        networking.hostName = "RAY";
        services.skhd.enable = true;
        nix.settings.trusted-users = [ "@admin" ];
        nix.configureBuildUsers = true;
        fonts.packages = with pkgs;
          [
            (iosevka-bin.override {
              variant = "SGr-IosevkaTermCurly";
            })
            (nerdfonts.override {
              fonts = [ "NerdFontsSymbolsOnly" ];
            })
            sarasa-gothic
            sarabun-font
            noto-fonts-emoji
          ];

        environment.systemPackages = with pkgs;
          [
            bat
            btop
            direnv
            du-dust
            duf
            fd
            gh
            git
            killall
            libqalculate
            lsd
            lunarvim
            nix-your-shell
            p7zip
            rename
            ripgrep
            starship
            tmux
            uutils-coreutils-noprefix
            wget
            xxd
            zoxide
          ];

        services.nix-daemon.enable = true;
        nix.settings.experimental-features = "nix-command flakes";

        programs.fish.enable = true;
        environment.shells = [ pkgs.fish ];
        users.users.raf.shell = pkgs.fish;
        users.users.raf.uid = 501;
        users.users.raf.home = "/Users/raf";
        users.knownUsers = [ "raf" ];

        system.configurationRevision = self.rev or self.dirtyRev or null;

        system.stateVersion = 4;

        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#rafs-MacBook-Pro
      darwinConfigurations."RAY" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."RAY".pkgs;
    };
}
