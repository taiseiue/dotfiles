{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
#      ics.japanese-proofreading
      vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vscode-remote.remote-containers
      golang.go
      hashicorp.terraform
#      daylerees.rainglow
#      mushan.vscode-paste-image
      github.codespaces
      github.copilot-chat
      github.vscode-github-actions
      ms-vsliveshare.vsliveshare
      streetsidesoftware.code-spell-checker
      docker.docker
      ms-azuretools.vscode-docker
      ms-ceintl.vscode-language-pack-ja
      hashicorp.hcl
      mathiasfrohlich.kotlin
      ms-azuretools.vscode-containers
#      fwcd.kotlin
      bmewburn.vscode-intelephense-client
    ];
  };
}
