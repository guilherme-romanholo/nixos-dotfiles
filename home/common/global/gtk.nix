{ pkgs, ... }:

{

  gtk = {
    enable = true;
    iconTheme = {
      name = "Gruvbox";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

  };

}
