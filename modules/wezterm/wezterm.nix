{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local fish_path = "${config.programs.fish.package}/bin/fish"
    '' + builtins.readFile ./wezterm.lua;
  };
  programs.vscode.profiles.default.userSettings = {
    "terminal.external.osxExec" = "WezTerm.app";
  };
}
