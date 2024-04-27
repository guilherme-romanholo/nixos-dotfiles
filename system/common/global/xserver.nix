{ pkgs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable SDDM Display Manager
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      theme = "${pkgs.sddm-theme}";
    };
    defaultSession = "hyprland";
  };

  # Enable the Plasma5 Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
