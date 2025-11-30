{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    envExtra = ''
    if [ "$(uname)" = 'Darwin' ]; then
      export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    fi
    '';
  initContent = ''
    if [ -f "$HOME/.zshrc_local" ]; then
      source "$HOME/.zshrc_local"
    fi
    '';
  };
}