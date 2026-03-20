{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
    ../modules/fonts.nix
    ../modules/wezterm/wezterm.nix
  ];

  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";

  home.packages = with pkgs; [
    m-cli
    chatgpt
    colima
    _1password-cli
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };
}
