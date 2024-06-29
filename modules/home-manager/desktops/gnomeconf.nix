{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gnomeconf.enable = lib.mkEnableOption "enable gnome user configs";
  };

  config = lib.mkIf config.gnomeconf.enable {

    home.packages = with pkgs; [
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
      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 40;
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Gruvbox-Dark-B";
      };

      "org/gnome/desktop/background" = {
        picture-uri = toString ./snowcity.jpg;
        picture-uri-dark = toString ./snowcity.jpg;
      };
    };
  };
}
