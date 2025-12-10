{ config, pkgs, ... }:

let
  isMac = pkgs.stdenv.isDarwin;
in
{
  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
  home.stateVersion = "25.05"; 

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/nvim.nix
    ./modules/zsh/zsh.nix
    ./modules/tmux.nix
    ./modules/git.nix
    ./modules/fonts.nix
    ./modules/zoxide.nix
  ];

  macPackages = pkgs.lib.mkIf isMac [
    m-cli
  ];

  home.packages =  pkgs.lib.flatten([
    gh ghq git-filter-repo
    fzf
    uv
    pnpm
    gcc
    curl
    coreutils-full
    imagemagick
    ffmpeg-full
    go
    cloudflared
    go-task
    primitive
    jdk25
    gradle
    _1password-cli
    awscli
    claude
    google-cloud-sdk
  ] ++ macPackages);

  home.file = {
    #"default.zshrc".source = ./modules/zsh/default.zshrc;
  };

  home.sessionVariables = pkgs.lib.mkIf isMac {
    SSH_AUTH_SOCK="~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };

  programs.home-manager.enable = true;
}
