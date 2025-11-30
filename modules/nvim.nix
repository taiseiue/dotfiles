{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    astrocore
    astrotheme
    astroui
    astrolsp
    mason-null-ls-nvim
    mason-nvim-dap-nvim
    ];
  };
}