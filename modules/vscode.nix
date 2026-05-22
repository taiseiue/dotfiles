{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ics.japanese-proofreading
      vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vscode-remote.remote-containers
      golang.go
      hashicorp.terraform
      daylerees.rainglow
      mushan.vscode-paste-image
    ];
  };
}
