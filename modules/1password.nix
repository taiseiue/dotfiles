{ config, pkgs, ... }:
let
  isMac = pkgs.stdenv.isDarwin;
in
{
  home.packages = with pkgs; [
    _1password-cli
  ];

  home.sessionVariables = pkgs.lib.mkIf isMac {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };
  programs.git.settings.gpg.ssh = pkgs.lib.mkIf isMac {
    # macOSなら、SSHは1PasswordのSSHエージェントを使う
    program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
  };
}
