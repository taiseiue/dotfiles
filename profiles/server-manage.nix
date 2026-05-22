{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    kubectl
    talosctl
    kubernetes-helm
    ansible
  ];
}
