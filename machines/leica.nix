{ config, pkgs, ... }:
{
  imports = [
    ../layers/darwin.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
