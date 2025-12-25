{ config, pkgs, ... }:

let
  isMac = pkgs.stdenv.isDarwin;
  macPackages = pkgs.lib.mkIf isMac [
    pkgs.m-cli
  ];
in
{
  home.username = "taiseiue";
  home.homeDirectory = "/Users/taiseiue";
  home.stateVersion = "25.05"; 

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/nvim.nix
    ./modules/zsh.nix
    ./modules/bash.nix
    ./modules/tmux.nix
    ./modules/git.nix
    ./modules/fonts.nix
    ./modules/zoxide.nix
  ];

  home.packages = pkgs.lib.flatten (
    (with pkgs; [
    gh ghq git-filter-repo
    coreutils-full gcc curl fzf go-task
    awscli google-cloud-sdk
    imagemagick ffmpeg-full primitive
    jdk25 gradle
    uv
    pnpm
    go
    cloudflared
    _1password-cli
    claude-code
    ])
    ++ (if isMac then [
      pkgs.m-cli
    ] else [])
  );

  home.file = {
    #"default.zshrc".source = ./modules/zsh/default.zshrc;
  };

  home.sessionVariables = pkgs.lib.mkIf isMac {
    SSH_AUTH_SOCK="${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };

  programs.home-manager.enable = true;
}
