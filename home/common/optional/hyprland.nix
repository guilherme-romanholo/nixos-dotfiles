{ config, pkgs, ...}:

{

  wayland.windowManager.hyprland = {
    # Enable Hyprland
    enable = true;
    # The hyprland package
    package = pkgs.hyprland;
    # Enable xwayland
    xwayland.enable = true;
    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    # systemd.enable = true;
  };

}
