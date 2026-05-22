{ config, pkgs, ... }:

{
  imports = [
    ./java.nix
  ];

 programs.vscode.profiles.default.extensions =
  (with pkgs.vscode-extensions; [
    mathiasfrohlich.kotlin
  ])
  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "fwcd";
      name = "kotlin";
      version = "0.2.36";
      sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
    }
  ];
}