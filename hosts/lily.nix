{ config, pkgs, ... }:
{
  imports = [
    ../profiles/base.nix
    ../profiles/server-manage.nix
    ../profiles/cloud.nix
    ../profiles/media.nix

    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix
    ../modules/1password.nix
    ../modules/minicom.nix

    # Languages
    ../profiles/go.nix
    ../profiles/cpp.nix
    ../profiles/nix.nix
    ../profiles/node.nix
    ../profiles/rust.nix
    ../profiles/python.nix
    ../profiles/markdown.nix
    ../profiles/csharp.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
}
