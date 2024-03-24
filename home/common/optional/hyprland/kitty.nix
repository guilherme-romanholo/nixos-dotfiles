{ pkgs, config, ... }:

{

  programs.kitty = {
    enable = true;
    theme = "${config.colorScheme.name}";
    # font = {
    #   name = config.fontProfiles.nerdfonts.family;
    #   size = 14;
    # };
    # extraConfig = ''
    #   background #${config.colorScheme.palette.base00}
    # '';
  };

}
