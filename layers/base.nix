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
    zsh-fzf-history-search
    zsh-fzf-tab
    gh
    ghq
    git-filter-repo
    coreutils-full
    gcc
    curl
    fzf
    go-task
    awscli2
    google-cloud-sdk
    imagemagick
    ffmpeg-full
    ffmpeg-full.lib
    jdk25
    gradle
    openssl
    uv
    pnpm
    nodejs_24
    go
    cloudflared
    claude-code
    minicom
    nixfmt
  ];

  home.file = {
    #"default.zshrc".source = ./modules/zsh/default.zshrc;
  };

  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--height ~40% --layout=reverse --border";
  };

  programs.home-manager.enable = true;
}
