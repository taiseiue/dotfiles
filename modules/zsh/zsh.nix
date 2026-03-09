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
        name = "zsh-abbr";
        src = "${pkgs.zsh-abbr}/share/zsh/zsh-abbr";
        file = "zsh-abbr.plugin.zsh";
      }
    ];

    initContent = builtins.readFile ./zshrc.sh;
  };
}
