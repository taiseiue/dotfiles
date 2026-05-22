# Markdownをいっぱい書くマシン用
{ config, pkgs, ... }:

{
  imports = [
    ./vscode.nix
  ];

 programs.vscode.profiles.default.extensions =
  (with pkgs.vscode-extensions; [
    yzhang.markdown-all-in-one
  ])
  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "mushan";
      name = "vscode-paste-image";
      version = "1.0.4";
      sha256 = "sha256-a6prHWZ8neNYJ+ZDE9ZvA79+5X0UlsFf8XSHYfOmd/I=";
    }
  ];
}