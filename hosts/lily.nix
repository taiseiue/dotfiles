{ config, pkgs, ... }:
{
  imports = [
    ../platforms/darwin.nix
    ../profiles/server-manage.nix
    ../profiles/rust.nix
    ../profiles/java.nix
    ../profiles/cpp.nix
    ../profiles/node.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix
    ../profiles/kotlin.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
