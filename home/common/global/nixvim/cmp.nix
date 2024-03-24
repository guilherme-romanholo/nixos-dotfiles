{
  
  programs.nixvim.plugins = {
    # Neovim completions
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "luasnip";}
      ];
    };
  };

}
