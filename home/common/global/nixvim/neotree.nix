{

  programs.nixvim = {
    plugins = {
      neo-tree.enable = true;
    };

    keymaps = [
      {
	mode = "n";
      	key = "<leader>e";
      	action = "<cmd>Neotree toggle<cr>";
      	options = {
      	  silent = true;
      	  desc = "New Tab";
      	};
      }
      {
	mode = "n";
      	key = "<leader>o";
      	action = "<cmd>Neotree focus<cr>";
      	options = {
      	  silent = true;
      	  desc = "Focus tree";
      	};
      }
    ];

  };

}
