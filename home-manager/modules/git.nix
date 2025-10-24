{ config, pkgs, ... }:

{
  programs.git.enable = true;

  programs.git.userName  = "taiseiue";
  programs.git.userEmail = "taiseiue@wsnet.jp";

  programs.git.aliases = {
    co = "checkout";
    br = "branch";
    ci = "commit";
    st = "status";
  };

  programs.git.extraConfig = {
    ghq.root = "~/source";
    
    core.excludesfile = "~/.config/git/ignore";
    core.hookspath    = "~/.config/git/hooks";

    color.diff   = "auto";
    color.status = "auto";
    color.branch = "auto";
    color.grep   = "auto";

    push.default = "current";
  };
}