{

  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = { 
        # C/C++
        clangd.enable = true;
        # Nix
        nixd.enable = true;
        # Python
        pylsp.enable = true;
      };
    };
  };

}
