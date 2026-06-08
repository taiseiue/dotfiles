{ config, pkgs, ... }:

{
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../modules/nvim.nix
    ../modules/tmux.nix
    ../modules/zoxide.nix
    ../modules/zsh/zsh.nix
    ../modules/bash/bash.nix
    ../modules/git/git.nix
    ../modules/fzf.nix
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
    claude-code
  ];

  home.file = {
    #"default.zshrc".source = ./modules/zsh/default.zshrc;
  };
  programs.home-manager.enable = true;
}
