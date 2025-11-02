{ config, pkgs, ... }:

let
  isMac = pkgs.stdenv.isDarwin;
{
  programs.git.enable = true;

  programs.git.settings.user.name  = "taiseiue";
  programs.git.settings.user.email = "taiseiue@wsnet.jp";

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
}