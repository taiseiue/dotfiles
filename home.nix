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
  ];

  home.packages =  with pkgs; [
    gh
    ghq
    git-filter-repo
    peco
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
    m-cli
    primitive
  ];

  home.file = {
    ".zshrc_local".source = ./zsh/.zshrc_local;
  };

  home.sessionVariables = pkgs.lib.mkIf isMac {
    SSH_AUTH_SOCK="~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };

  programs.home-manager.enable = true;
}
