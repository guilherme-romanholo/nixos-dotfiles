{ inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./cmp.nix
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
      luasnip.enable = true;
    };
  };
	
}
