{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    awscli2
    google-cloud-sdk
  ];
}
