{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../modules/nvim.nix
    ../modules/tmux.nix
    ../modules/zoxide.nix
    ../modules/zsh/zsh.nix
    ../modules/bash/bash.nix
    ../modules/git/git.nix
  ];

  home.packages = with pkgs; [
    coreutils-full
    gcc
    curl
    fzf
    go-task
    openssl
    gh
    ghq
    git-filter-repo
    awscli2
    google-cloud-sdk
    imagemagick
    ffmpeg
    ffmpeg.lib
    uv
    go
    cloudflared
    claude-code
    minicom
  ];

  home.file = {
    #"default.zshrc".source = ./modules/zsh/default.zshrc;
  };

  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--height ~40% --layout=reverse --border";
  };

  programs.home-manager.enable = true;
}
