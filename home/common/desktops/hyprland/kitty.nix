{ pkgs, config, ... }:

{

  programs.kitty = {
    enable = true;
    theme = "${config.colorScheme.name}";
    # extraConfig = ''
    #   background #${config.colorScheme.palette.base00}
    # '';
  };

}
