{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    tenv  
  ];
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    hashicorp.hcl
    hashicorp.terraform
  ];
}
