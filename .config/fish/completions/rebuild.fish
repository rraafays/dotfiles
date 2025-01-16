complete -c rebuild -f -a boot -d "Build the new configuration and make it the boot default (as with nixos-rebuild switch), but do not activate it."
complete -c rebuild -f -a switch -d "Build and activate the new configuration, and make it the boot default."
complete -c rebuild -f -a test -d "Build and activate the new configuration, but do not add it to the GRUB boot menu."
complete -c rebuild -f -a upgrade -d "Alias of switch --upgrade --install-bootloader"
complete -c rebuild -l upgrade -d 'Update the root user\'s channel named nixos before rebuilding the system'
complete -c rebuild -l install-bootloader -d 'Causes the boot loader to be (re)installed on the device specified by the rel…'
complete -c rebuild -l no-build-nix -d 'Normally, nixos-rebuild first builds the nixUnstable attribute in Nixpkgs, an…'
complete -c rebuild -l fast -d 'Equivalent to -no-build-nix Ns \\&'
complete -c rebuild -l rollback -d 'Instead of building a new configuration as specified by /etc/nixos/configurat…'
complete -c rebuild -l builders -d 'Allow ad-hoc remote builders for building the new system'
complete -c rebuild -l profile-name -d 'Instead of using the Nix profile /nix/var/nix/profiles/system to keep track o…'
complete -c rebuild -l specialisation -d 'Activates given specialisation; when not specified, switching and testing wil…'
complete -c rebuild -l build-host -d 'Instead of building the new configuration locally, use the specified host to …'
complete -c rebuild -l target-host -d 'Specifies the NixOS target host'
complete -c rebuild -l use-substitutes -d 'When set, nixos-rebuild will add -use-substitutes to each invocation of nix-c…'
complete -c rebuild -l use-remote-sudo -d 'When set, nixos-rebuild prefixes activation commands that run on the -target-…'
complete -c rebuild -l no-ssh-tty -d 'When set, nixos-rebuild will not request a tty when executing commands on the…'
complete -c rebuild -l file -d 'Enable and build the NixOS system from the specified file'
complete -c rebuild -l attr -d 'Enable and build the NixOS system from nix file and use the specified attribu…'
complete -c rebuild -l flake -d 'Build the NixOS system from the specified flake'
complete -c rebuild -l no-flake -d 'Do not imply -flake if /etc/nixos/flake. nix exists'
