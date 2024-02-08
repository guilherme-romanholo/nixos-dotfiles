{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    cycle = false;

    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "Noto Sans CJK JP 12";
      show-icons = true;
      disable-history = true;
      bw = 0;
      display-drun = "";
      display-window = "";
      display-combi = "";
      icon-theme = "Fluent-dark";
      terminal = "kitty";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
    };

    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        font = "Noto Sans CJK JP Bold 12";
        background-color = mkLiteral "#${config.colorScheme.palette.base00}60";
        foreground = mkLiteral "#${config.colorScheme.palette.base00}60";
        text-color = mkLiteral "#${config.colorScheme.palette.base05}";
      };

      window = {
        border= mkLiteral "3px 3px 2px 3px";
        border-color= mkLiteral "#${config.colorScheme.palette.base0D}";
        border-radius= mkLiteral "6px 6px 0px 0px";
        location = mkLiteral "center";
        spacing = mkLiteral "2px";
        children = map mkLiteral [ "mainbox" ];
      };

      mainbox = {
        spacing = mkLiteral "0";
        children = map mkLiteral [ "inputbar" "message" "listview" ];
      };

      inputbar = {
        padding= mkLiteral "11px";
        border= mkLiteral "0px 0px 2px 0px";
        border-color= mkLiteral "#${config.colorScheme.palette.base0D}";
        border-radius= mkLiteral "6px 6px 0px 0px";
      };

      message = {
        padding = mkLiteral "0";
        border-color = mkLiteral "#${config.colorScheme.palette.base0D}";
        border = mkLiteral "0px 1px 1px 1px";
      };

      lastview = {
        border = mkLiteral "0px 3px 3px 3px"; 
        border-radius = mkLiteral "0px 0px 6px 6px";
        border-color = mkLiteral "#${config.colorScheme.palette.base0D}";
      };

      button = {
        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "#${config.colorScheme.palette.base0D}";
      };

      "element selected.normal" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base03}";
      };
    };
  };
}
