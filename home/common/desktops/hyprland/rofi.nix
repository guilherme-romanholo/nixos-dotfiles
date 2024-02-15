{ config, pkgs, ... }:

{

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {

      "configuration" = {
        modi = "drun";
        font = "Rubik 10";
        show-icons = true;
        icons-theme = "Reversal-dark";
        display-drun = "";
        drun-display-format = "{name}";
        sidebar-mode = false;
      };

      "*" = {
        background = mkLiteral "#${config.colorScheme.palette.base00}";
        foreground = mkLiteral "#${config.colorScheme.palette.base06}";
        border = mkLiteral "#${config.colorScheme.palette.base04}";
        selected = mkLiteral "#${config.colorScheme.palette.base01}";

        background-color = mkLiteral "var(background)";
        text-color = mkLiteral "var(foreground)";
      };

      "window" = {
        border-radius = mkLiteral "7px";
        border = mkLiteral "2px solid";
        border-color = mkLiteral "var(border)";
        background-color = mkLiteral "var(background)";
        width = mkLiteral "50%";
        padding = mkLiteral "32px";
      };

      "prompt" = {
        background-color = mkLiteral "var(selected)";
        enabled = true;
        padding = mkLiteral "0.5% 32px 0% -0.5%";
        font = "Rubik 10";
      };

      "entry" = {
        placeholder = "Search";
        background-color = mkLiteral "var(selected)";
        placeholder-color = mkLiteral "var(foreground)";
        expand = true;
        padding = mkLiteral "0.15% 0% 0% 0%";
      };

      "mainbox" = { 
        border-radius = mkLiteral "7px";
        children = [ "inputbar" "listview" ]; 
        spacing = mkLiteral "2%";
        padding = mkLiteral "2% 1% 2% 1%";
      };

      "inputbar" = {
        children = [ "prompt" "entry" ];
        background-color = mkLiteral "var(selected)";
        expand = false;
        border-radius = mkLiteral "6px";
        margin = mkLiteral "0%";
        padding = mkLiteral "10px";
      };

      "listview" = {
      	columns = mkLiteral "4";
      	lines = mkLiteral "3";
      	cycle = false;
      	dynamic = true;
      	layout = mkLiteral "vertical";
      };
      
      "element" = {
      	orientation = mkLiteral "vertical";
      	padding = mkLiteral "2% 0% 2% 0%";
      };
      
      "element-icon" = {
      	size = mkLiteral "48px";
      	horizontal-align = mkLiteral "0.5";
      };
      
      "element-text" = {
      	expand = true;
      	vertical-align = mkLiteral "0.5";
      	horizontal-align = mkLiteral "0.5";
      	margin = "0.5% 0.5% -0.5% 0.5%";
      };

      "element-text, element-icon" = {
      	background-color = mkLiteral "inherit";
      	text-color = mkLiteral "inherit";
      };

      "element selected" = {
      	background-color = mkLiteral "var(selected)";
      	border-radius = mkLiteral "6px";
      };

    };
  };

}
