{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.common
    outputs.homeManagerModules.optional
  ];

  # --- Common --- #
  common.enable = true;

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";

  # --- Optional --- #

  home.packages = with pkgs; [
    neofetch
    firefox
    discord

    gruvbox-gtk-theme

    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.pop-shell
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
	"dash-to-dock@micxgx.gmail.com"
	"pop-shell@system76.com"
      ];
    };

    # gnome.dconf-editor
    "org/gnome/shell/extensions/user-theme" = {
      name = "Gruvbox-Dark-B";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dash-max-icon-size = 40;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    "org/gnome/desktop/background" = {
      picture-uri = toString ./snowcity.jpg;
      picture-uri-dark = toString ./snowcity.jpg;
    };
  };

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
