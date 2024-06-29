{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.common
    outputs.homeManagerModules.desktops
    outputs.homeManagerModules.optional
  ];

  # --- Common --- #
  common.enable = true;

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";

  # --- Desktops --- #
  gnomeconf.enable = true;

  # --- Optional --- #

  home.packages = with pkgs; [
    neofetch
    firefox
    discord

    gruvbox-gtk-theme

    jetbrains.pycharm-professional
  ];


  gtk = {
    enable = true;

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-icons-plus;
    };

    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
