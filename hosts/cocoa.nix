{ config, pkgs, ... }:
{
  imports = [
    ../platforms/darwin.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix

    # Languages
    ../profiles/node.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
