{ config, pkgs, ... }:

let
  isMac = pkgs.stdenv.isDarwin;
in
{
  programs.git.enable = true;

  programs.git.settings.user = {
    name = "taiseiue";
    email = "taiseiue@wsnet.jp";
    signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGlgPD2+ahEVUXRvZJ+DlPti2UYY1FMR4GRg5u4nX46v";
  };

  programs.git.settings.commit = {
    gpgsign = true;
  };

  programs.git.settings.gpg = {
    format = "ssh";
  };

  programs.git.settings.aliases = {
    co = "checkout";
    br = "branch";
    ci = "commit";
    st = "status";
  };

  programs.git.settings.core = {
    excludesfile = "~/.config/git/ignore";
    hookspath    = "~/.config/git/hooks";
  };

  programs.git.settings.ghq = {
    root = "~/source";
  };
  
  programs.git.settings.color = {
    diff   = "auto";
    status = "auto";
    branch = "auto";
    grep   = "auto";
  }; 

  programs.git.settings.pull = {
    rebase = "false";
  };
  programs.git.settings.push = {
    default = "current";
  };
  
  programs.git.settings.gpg.ssh =  pkgs.lib.mkIf isMac {
    # macOSなら、SSHは1PasswordのSSHエージェントを使う
    program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
  };

  home.file = {
    ".config/git/ignore".source = ./ignore;
    ".config/git/hooks/pre-commit" = {
      source = ./hooks/pre-commit.sh;
      executable = true;
    };
  };
}
