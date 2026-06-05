{ config, pkgs, ... }:
{
  imports = [
    ../platforms/darwin.nix
    ../profiles/server-manage.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix

    # Languages
    ../profiles/go.nix
    ../profiles/cpp.nix
    ../profiles/nix.nix
    ../profiles/node.nix
    ../profiles/rust.nix
    ../profiles/python.nix
    ../profiles/markdown.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
