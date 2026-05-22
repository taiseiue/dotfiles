{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    dotnet-sdk
  ];
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-dotnettools.csdevkit
    ms-dotnettools.csharp
  ];
}
