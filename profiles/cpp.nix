{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  programs.vscode.profiles.default.extensions =
    (with pkgs.vscode-extensions; [
      # ms-vscode.cpp-devtools
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      twxs.cmake
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        publisher = "ics";
        name = "japanese-proofreading";
        version = "1.27.1";
        sha256 = pkgs.lib.fakeSha256;
      }
    ];
}