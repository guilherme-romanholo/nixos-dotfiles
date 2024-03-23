{ pkgs, ... }:

{

  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "Gruvbox";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
  };

}
