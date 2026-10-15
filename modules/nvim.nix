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
          sha256 = "sha256-3m94sIGiF7RUNnLtZ8SIAzjXS2BGGGpC1lvw5QrmPDM=";
        };
      })
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      telescope-nvim
      plenary-nvim
      oil-nvim
      (nvim-treesitter.withAllGrammars)
      gitsigns-nvim
      nvim-tree-lua
      nvim-web-devicons
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.api.nvim_create_autocmd("FileType", {
        callback = function() pcall(vim.treesitter.start) end,
      })
      require("nvim-tree").setup({})
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    '';
  };
}
