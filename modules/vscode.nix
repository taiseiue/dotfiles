{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extensions =
      (with pkgs.vscode-extensions; [
        vscodevim.vim
        yzhang.markdown-all-in-one
        ms-vscode-remote.remote-containers
        golang.go
        github.codespaces
        github.copilot-chat
        github.vscode-github-actions
        ms-vsliveshare.vsliveshare
        streetsidesoftware.code-spell-checker
        docker.docker
        ms-azuretools.vscode-docker
        ms-ceintl.vscode-language-pack-ja
        ms-azuretools.vscode-containers
        bmewburn.vscode-intelephense-client
      ])
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          publisher = "ICS";
          name = "japanese-proofreading";
          version = "1.3.0";
          sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
        }
        {
          publisher = "daylerees";
          name = "rainglow";
          version = "1.5.2";
          sha256 = "sha256-1c/xQYnuJ3BkwfqjMeT2kG1ZsXyjEOypJs0pJbouZMQ=";
        }
        {
          publisher = "mushan";
          name = "vscode-paste-image";
          version = "1.0.4";
          sha256 = "sha256-a6prHWZ8neNYJ+ZDE9ZvA79+5X0UlsFf8XSHYfOmd/I=";
        }
      ];
  };
}