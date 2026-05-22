{ config, pkgs, ... }:
{
  imports = [
    ../profiles/base.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/home/taiseiue";

}
