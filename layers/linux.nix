{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/home/taiseiue";

}
