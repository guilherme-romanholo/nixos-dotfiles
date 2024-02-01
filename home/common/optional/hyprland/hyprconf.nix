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

     exec-once = [
       "${pkgs.waybar}/bin/waybar"
       "${pkgs.swaybg}/bin/swaybg -i ${toString ../../wallpapers/gruv_city.png}"
     ];
     
     bind = [
       "$mod, M, exit"
       "$mod, Q, killactive"
       "$mod, Return, exec, ${pkgs.kitty}/bin/kitty"
       "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
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
  };

}
