{ config, pkgs, ... }:
{
  imports = [
    ../platforms/darwin.nix
    ../profiles/server-manage.nix
    ../profiles/rust.nix
    ../profiles/java.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
