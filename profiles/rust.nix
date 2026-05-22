{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    cargo
    rustc
    rustfmt
  ];
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
  ];
}
