{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    go
  ];
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    golang.go
  ];
  programs.vscode.profiles.default.userSettings = {
    "go.formatTool" = "goimports";
    "go.lintTool" = "golangci-lint";
    "go.lintOnSave" = "file";
  };
}
