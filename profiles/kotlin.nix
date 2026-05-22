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
      sha256 = "sha256-tCpxFWSQZNhiHdJyxSbQ1QakS2jNqWQrA2/grLZklrM=";
    }
  ];
}