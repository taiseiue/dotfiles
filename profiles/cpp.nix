{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jeff-hykin.better-cpp-syntax
    ms-vscode.cpp-devtools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    twxs.cmake
  ];
}
