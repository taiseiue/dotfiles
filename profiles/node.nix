{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    pnpm
    nodejs_24
  ];
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    biomejs.biome
    vitest.explorer
  ];
}
