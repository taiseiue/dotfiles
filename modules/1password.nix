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
  programs.git.settings = pkgs.lib.mkIf isMac {
    # macOSで1Passwordが入っていればいつもの公開鍵によるコード署名が使える
    user = {
      signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGlgPD2+ahEVUXRvZJ+DlPti2UYY1FMR4GRg5u4nX46v";
    };
    gpg = {
      format = "ssh";
      program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };
    commit = {
      gpgsign = true;
    };
  };
}
