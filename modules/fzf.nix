{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
  ];

  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--height ~40% --layout=reverse --border";
  };
}
