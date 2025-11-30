{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      if [ -f "$HOME/.zshrc_local" ]; then
        source "$HOME/.zshrc_local"
      fi
      '';
    };
}