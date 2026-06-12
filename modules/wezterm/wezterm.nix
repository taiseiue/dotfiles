{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
  programs.vscode.profiles.default.userSettings = {
    "terminal.external.osxExec" = "WezTerm.app";
  };
}
