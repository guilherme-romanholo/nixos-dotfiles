{ pkgs, packages, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable SDDM Display Manager
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      #theme = "${pkgs.sddm-theme}";
    };
    session = [
      {
        manage = "desktop";
        name = "plasma";
        start = ''exec env KDEWM=${pkgs.bspwm}/bin/bspwm ${pkgs.plasma-workspace}/bin/startplasma-x11'';
      }
    ];
  };

  # Enable the Plasma5 Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
  # Enable the Bspwm Window Manager.
  services.xserver.windowManager.bspwm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
