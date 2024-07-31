{
  description = "nix flake environment for cognitran website";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOs/nixpkgs";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [ rustfmt clippy ] ++ lib.optional stdenv.isDarwin libiconv;
            nativeBuildInputs = with pkgs; [
              stow
              nixpkgs-fmt
            ];
          };
        }
      );
}
