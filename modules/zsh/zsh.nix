{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "$" = "";
      "cd.." = "cd ..";
      vi = "nvim";
      ll = "ls -alF";
      grep = "grep --color=auto";
      g = "_ghq";
      ghq = "_ghq";
    };

    plugins = [
      {
        name = "zsh-fzf-history-search";
        src = "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search";
      }
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    initContent = builtins.readFile ./zshrc.sh;
  };
}
