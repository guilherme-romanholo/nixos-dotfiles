{ pkgs, ... }:

{

  gtk = {
    enable = true;

    theme = {
      name = "Ayu";
      package = pkgs.ayu-theme-gtk;
    };

    iconTheme = {
      name = "Tela-Circle";
      package = pkgs.tela-circle-icon-theme;
    };
  };

}
