{ config, pkgs, ... }:
let
  isMac = pkgs.stdenv.isDarwin;
in
{
  imports = [
    ../profiles/base.nix
  ];

  home.packages = with pkgs; [
    _1password-cli
  ];

  home.sessionVariables = pkgs.lib.mkIf isMac {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };
}
