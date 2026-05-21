{ config, pkgs, ... }:

{
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    ics.japanese-proofreading
    biomejs.biome
    vscodevim.vim
    yzhang.markdown-all-in-one
    ms-vscode-remote.remote-containers
    golang.go
    hashicorp.terraform
    vitest.explorer
  ];
  };
}
