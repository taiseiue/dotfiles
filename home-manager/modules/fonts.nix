{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    plemoljp-nf
  ];
}
