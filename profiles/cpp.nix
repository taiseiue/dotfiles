{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

 programs.vscode.profiles.default.extensions =
  (with pkgs.vscode-extensions; [
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    twxs.cmake
  ])
  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "ICS";
      name = "japanese-proofreading";
      version = "1.3.0";
      sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
    }
    {
      publisher = "ms-vscode";
      name = "cpp-devtools";
      version = "0.6.2";
      sha256 = "sha256-Wz8lg21dIRUZluVOPzlthyzxlUirTCIVU3bkLOLI2eI=";
    }
  ];
}