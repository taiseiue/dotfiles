{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "rainglow";
        src = pkgs.fetchFromGitHub {
          owner = "rainglow";
          repo = "vim";
          rev = "master"; 
          sha256 = "";
        };
      })
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      telescope-nvim
      plenary-nvim
      oil-nvim
      nvim-treesitter
      gitsigns-nvim
    ];
  };
}
