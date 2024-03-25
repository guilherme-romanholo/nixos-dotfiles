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

      nvim-autopairs.enable = true;

      luasnip = {
	enable = true;
	extraConfig = {
	  enable_autosnippets = true;
	  store_selection_keys = "<Tab>";
	};
      };

    };
  };
	
}
