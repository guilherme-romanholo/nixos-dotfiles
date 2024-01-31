
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable GDM Display Manager
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
