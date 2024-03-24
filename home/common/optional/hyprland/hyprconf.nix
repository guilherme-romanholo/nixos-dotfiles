{ config, pkgs, ...}:

{

  wayland.windowManager.hyprland = {
    # Enable Hyprland
    enable = true;
    # Enable xwayland
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    exec = [
      "${pkgs.swaybg}/bin/swaybg -i ${toString ../../files/wallpapers/gruvbox/gruv_village.png}"
    ];

    exec-once = [
      "${pkgs.waybar}/bin/waybar"
    ];

    input = {
      kb_layout = "br";
      follow_mouse = 1;
      sensitivity = 0.5;
    };

    monitor = [ "VGA-1,preferred,1680x0,1" "DP-2,preferred,0x0,1" ];

    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 2;
      layout = "dwindle";
      allow_tearing = false;
      "col.active_border" = "rgba(${config.colorScheme.palette.base05}ee) rgba(${config.colorScheme.palette.base03}ee) 45deg";
      "col.inactive_border" = "rgba(${config.colorScheme.palette.base00}ee)";
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        passes = 3;
        size = 10;
      };
      drop_shadow = false;
    };

    animations = {
      enabled = true;

      bezier = [ 
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1" 
      ];

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    dwindle = {
      no_gaps_when_only = false;
      pseudotile = true; 
      preserve_split = true; 
      force_split = 2;
    };

    misc = {
      vfr = true;
      force_default_wallpaper = -1;
    };

    bind = [
      "$mod, M, exit"
      "$mod, Q, killactive"
      "ALT, return, fullscreen"
      "$mod, Return, exec, ${pkgs.kitty}/bin/kitty"
      "$mod SHIFT, Return, exec, ${pkgs.kitty}/bin/kitty --class termfloat"
      "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
      "$mod, A, exec, ${pkgs.rofi}/bin/rofi -show drun -show-icons"
      "$mod, L, exec, ${pkgs.swaylock-effects}/bin/swaylock"
    ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    windowrule = [
      # Kitty
      "opacity 0.8,^(kitty)$"
      # Float Terminal
      "float,^(termfloat)$"
      "size 800 500,^(termfloat)$"
      "move center,^(termfloat)$"
    ];
  };

}
