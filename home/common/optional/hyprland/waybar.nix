{ pkgs, config, ... }:

{

  programs.waybar = {
    enable = true;
    style = ''
      window#waybar {
	        background-color: transparent;
          font-family: "Lato";
      }

      #custom-nix{
          margin-top: 8px;
          margin-left: 8px;
          border-radius: 8px;
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base0D};
          font-size: 20px;
          padding: 8px 22px 6px 14px;
      }

      #workspaces {
        margin-top: 8px;
        margin-left: 8px;
        border-radius: 8px;
	      background-color: #${config.colorScheme.palette.base00};
	      padding: 4px;
        font-size: 14px;    
      }

      #workspaces button {
        color: #${config.colorScheme.palette.base06};
        padding: 5px 11px 2px 9px;
      }

      #workspaces button:hover {
        background: #${config.colorScheme.palette.base03};
      }

      #workspaces button.active{
        border-radius: 12px;
        background-color: #${config.colorScheme.palette.base0C};
      }

      #clock {
        margin-top: 8px;
        margin-left: 8px;
        border-radius: 8px;
	      background-color: #${config.colorScheme.palette.base00};
	      padding: 6px 8px 4px 8px;
        color: #${config.colorScheme.palette.base09};
        font-size: 11px;
        font-weight: bold;
      }

      #tray {
        font-size: 20px;
      }

      #cpu{
        margin-top: 8px;
        margin-right: 0px;
        border-radius: 8px 0px 0px 8px;
	      background-color: #${config.colorScheme.palette.base00};
        padding: 8px 16px 6px 16px;
        color: #${config.colorScheme.palette.base0B};
        font-size: 17px;
      }

      #memory {
        margin-top: 8px;
        margin-right: 8px;
        border-radius: 0px 8px 8px 0px;
	      background-color: #${config.colorScheme.palette.base00};
        padding: 8px 16px 6px 0px;
        color: #${config.colorScheme.palette.base0B};
        font-size: 17px;
      }

      #pulseaudio{
        margin-top: 8px;
        margin-right: 8px;
        border-radius: 8px;
	      background-color: #${config.colorScheme.palette.base00};
        padding: 8px 16px 6px 16px;
        background-color: #${config.colorScheme.palette.base00};
        color: #${config.colorScheme.palette.base0A};
        font-size: 20px;
      }

      #network{
        margin-top: 8px;
        margin-right: 8px;
        border-radius: 8px;
	      background-color: #${config.colorScheme.palette.base00};
        padding: 8px 16px 6px 16px;
        font-size: 18px;
        color: #${config.colorScheme.palette.base0E};
      }

      #custom-power {
        margin-top: 8px;
        margin-right: 8px;
        border-radius: 8px;
        color: #${config.colorScheme.palette.base08}; 
        padding: 6px 19px 6px 15px;
        background-color: #${config.colorScheme.palette.base00};
        font-size: 15px;
      }
    '';

    settings.mainBar = {
      layer = "bottom";
      position = "top";

      modules-left = [
        "custom/nix" 
        "hyprland/workspaces" 
      ];

      modules-center = [ 
        "clock" 
      ];

      modules-right = [
        "tray"
        "cpu"
        "memory"
        "pulseaudio"
        "network"
        "custom/power"
      ];

      "custom/nix"  = {
        format = "";
      };

      "hyprland/workspaces" = {
        all-outputs = true;
        format = "{icon}";
        format-icons = {
          "1" = "";
          "2" = "󰈹";
          "3" = "";
          "4" = "󰝚";
          "5" = "";
          "6" = "";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
        };
      };

      "clock" = {
        format = "{:  <span color='#${config.colorScheme.palette.base06}'>%H:%M</span>   |     <span color='#${config.colorScheme.palette.base06}'>%a, %b %d</span>}";
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          format = { today = "<span color='#${config.colorScheme.palette.base0E}'><b><u>{}</u></b></span>"; };
          mode = "month";
          on-scroll = 1;
        };
      };

      "cpu" = {
        format = "󰍛  {icon}";
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      };

      "memory" = {
        format = "  {icon}";
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      };

      "pulseaudio" = {
        format = "{icon}";
        format-icons = [ "" "" "󰕾" "" ];
        format-muted = "󰸈";
        tooltip = true;
        tooltip-format = "{volume}%";
      };

      "network" = {
        format = "󰈁";
        format-disconnected = "󰖪";
        format-ethernet = "󰈁";
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        format-wifi = "{icon}";
        on-click = "$HOME/.config/rofi/nm.sh";
        tooltip = true;
        tooltip-format = "{essid}\n{signalStrength} UP:{bandwidthUpBytes} DOWN:{bandwidthDownBytes}";
      };

      "custom/power" = {
        format = "⏻";
        on-click = "systemctl suspend";
      };

    };

  };

}
