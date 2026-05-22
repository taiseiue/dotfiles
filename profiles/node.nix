{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    pnpm
    nodejs_24
  ];
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    biomejs.biome
    vitest.explorer
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
  ];
}
