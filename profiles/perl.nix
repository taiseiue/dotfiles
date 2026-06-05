{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    perl
    perlcritic
  ];

  programs.vscode.profiles.default.extensions =
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        publisher = "bscan";
        name = "perlnavigator";
        version = "0.8.21";
        sha256 = "sha256-2T8CkwdEVeanmLb9rkP7VDBHW777EPjnsO2DFKNKnfA=";
      }
    ];
}
