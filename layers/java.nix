{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    jdk25
    gradle
  ];
}
