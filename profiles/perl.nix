{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    perl
    perlcritic
  ];
  programs.vscode.profiles.default.extensions = vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "bscan";
      name = "perlnavigator";
      version = "0.8.21";
      sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
    }
  ];
}
