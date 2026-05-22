{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
#    ms-vscode.cpp-devtools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    twxs.cmake
  ];
  pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.27.1";
        sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
      }
    ];
}
