{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    colima
  ];
  home.file = {
    "~/.colima/default/colima.yaml".source = ./profiles/default.yaml;
  };
}
