# Node.js environment for strudel.nvim (Puppeteer build + runtime).
# Node 22 is used because Node 26 breaks Puppeteer's dependency chain.
{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
  ];
}
