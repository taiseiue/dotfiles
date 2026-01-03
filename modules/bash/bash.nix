{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      "cd.." = "cd ..";
      vi = "nvim";
      ll = "ls -alF";
      grep = "grep --color=auto";
      g = "_ghq";
      ghq = "_ghq";
    };

    bashrcExtra = builtins.readFile ./bashrc.sh;
  };
}
