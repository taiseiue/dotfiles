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
  home.stateVersion = "25.11"; 

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/nvim.nix
    ./modules/tmux.nix
    ./modules/git.nix
    ./modules/fonts.nix
    ./modules/zoxide.nix
    ./modules/zsh/zsh.nix
    ./modules/bash/bash.nix
    ./modules/wezterm/wezterm.nix
  ];

  home.packages = pkgs.lib.flatten (
    (with pkgs; [
    zsh-fzf-history-search zsh-fzf-tab
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
      pkgs.audacity
      pkgs.chatgpt
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
