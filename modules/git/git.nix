{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "taiseue";
        email = "taiseiue@wsnet.jp";
      };
      aliases = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
      };
      core = {
        excludesfile = "~/.config/git/ignore";
        hookspath = "~/.config/git/hooks";
      };
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        grep = "auto";
      };
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
      pull = {
        rebase = "false";
      };
      push = {
        default = "current";
      };
      ghq = {
        root = "~/source";
      };
    };
  };

  home.file = {
    ".config/git/ignore".source = ./ignore;
    ".config/git/hooks/pre-commit" = {
      source = ./hooks/pre-commit.sh;
      executable = true;
    };
  };
}
