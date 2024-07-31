{
  description = "Raf's Macbook: RAY";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, config, ... }: {
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
            jankyborders
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
        system.activationScripts.wallpaper.text = ''
          osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"/System/Library/Desktop Pictures/Solid Colors/Black.png\" as POSIX file"
        '';
        launchd.user.agents.jankyborders = {
          serviceConfig = {
            ProgramArguments = [
              "${pkgs.jankyborders}/bin/borders"
              "active_color=0xFFEBDBB2"
              "inactive_color=0xFF928373"
              "width=4"
              "order=above"
            ];

            KeepAlive = true;
            RunAtLoad = true;
            ProcessType = "Interactive";
            EnvironmentVariables = {
              PATH = "${pkgs.jankyborders}/bin:${config.environment.systemPath}";
              LANG = "en_US.UTF-8";
            };
          };
        };
        system.defaults = {
          SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
          loginwindow.GuestEnabled = false;
          dock = {
            autohide = true;
            autohide-delay = 0.0;
            minimize-to-application = true;
            mru-spaces = false;
            static-only = true;
          };

          finder = {
            AppleShowAllExtensions = true;
            AppleShowAllFiles = true;
            CreateDesktop = false;
            FXEnableExtensionChangeWarning = false;
            FXPreferredViewStyle = "Nlsv";
            QuitMenuItem = true;
            ShowPathbar = true;
            ShowStatusBar = true;
            _FXShowPosixPathInTitle = true;
          };

          NSGlobalDomain = {
            "com.apple.keyboard.fnState" = true;
            ApplePressAndHoldEnabled = false;
            KeyRepeat = 2;
            InitialKeyRepeat = 12;
            AppleKeyboardUIMode = 3;
            AppleFontSmoothing = 1;
            _HIHideMenuBar = true;
          };
        };
      };
    in
    {
      darwinConfigurations."RAY" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };
      darwinPackages = self.darwinConfigurations."RAY".pkgs;
    };
}
