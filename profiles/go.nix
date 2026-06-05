{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    go
  ];
  programs.vscode.profiles.default.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    publisher = 
    name
    version
    sha256 = "sha256-Wz8lg21dIRUZluVOPzlthyzxlUirTCIVU3bkLOLI2eI=";
  ];

}
