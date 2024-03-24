{ inputs, ... }:
{

  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  
  programs.plasma = {
    enable = true;

    workspace = {
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      wallpaper = "${../../files/wallpapers/gruvbox/gruv_city.png}";

    };

  };

}
