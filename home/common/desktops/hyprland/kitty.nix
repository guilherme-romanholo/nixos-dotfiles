{ pkgs, config, ... }:

{

  programs.kitty = {
    enable = true;
    theme = "${config.colorScheme.slug}";
    # extraConfig = ''
    #   background #${config.colorScheme.palette.base00}
    # '';
  };

}
