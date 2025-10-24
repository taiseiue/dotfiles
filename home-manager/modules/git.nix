{ config, pkgs, ... }:

{
  programs.git.enable = true;

  programs.git.settings.userName  = "taiseiue";
  programs.git.settings.userEmail = "taiseiue@wsnet.jp";

  programs.git.settings.aliases = {
    co = "checkout";
    br = "branch";
    ci = "commit";
    st = "status";
  };

  programs.git.settings.extraConfig = {
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