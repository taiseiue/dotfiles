{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];
  home.packages = with pkgs; [
    clang-tools
  ];
  programs.vscode.profiles.default.extensions =
    (with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      twxs.cmake
      vscode-extensions.llvm-vs-code-extensions.vscode-clangd
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        publisher = "ICS";
        name = "japanese-proofreading";
        version = "1.3.0";
        sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
      }
      {
        publisher = "ms-vscode";
        name = "cpp-devtools";
        version = "0.6.2";
        sha256 = "sha256-Wz8lg21dIRUZluVOPzlthyzxlUirTCIVU3bkLOLI2eI=";
      }
    ];
  programs.neovim.plugins = with pkgs.vimPlugins; [
    coc-clangd
  ];
}
