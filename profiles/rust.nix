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
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
  ];
}
