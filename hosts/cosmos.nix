{ config, pkgs, ... }:
{
  imports = [
    ../profiles/base.nix
    ../modules/fonts.nix
    ../modules/colima/colima.nix
    ../modules/wezterm/wezterm.nix
    ../modules/vscode.nix
    ../modules/1password.nix

    # Languages
    ../profiles/node.nix
    ../profiles/go.nix
  ];
  home.packages = with pkgs;[
    skhd
  ];
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  home.username = "uemura.taisei";
  home.homeDirectory = "/Users/uemura.taisei";
}
