{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    nixfmt
  ];
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    jnoortheen.nix-ide
  ];
}
