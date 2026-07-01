{ config, pkgs, ... }:
{
  imports = [
    ../profiles/base.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix
    ../modules/1password.nix
    ../profiles/cloud.nix

    # Languages
    ../profiles/node.nix
    ../profiles/perl.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
