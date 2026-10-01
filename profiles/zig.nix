{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];
  home.packages = with pkgs; [
    zig
    zls
  ];
  programs.vscode.profiles.default.extensions = (
    with pkgs.vscode-extensions;
    [
      ziglang.vscode-zig
    ]
  );
}
