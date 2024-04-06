{ inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./lspkind.nix
    ./cmp.nix
    ./luasnip.nix
    ./neotree.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
      persistence.enable = true;
    };

    globals.mapleader = " ";

  };
	
}
