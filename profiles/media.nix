{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    imagemagick
    ffmpeg
    ffmpeg.lib
  ];
}
