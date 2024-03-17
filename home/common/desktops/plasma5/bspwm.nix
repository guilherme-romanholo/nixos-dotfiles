{ pkgs, ...}:

{

  xsession.windowManager.bspwm = {
    enable = true;

    startupPrograms = [
      "sxhkd"
    ];

    settings = {
      top_padding = 44;
      window_gap = 8;
    };
  };

  services.sxhkd = {
    enable = true;

    keybindings = {
      "super + Return" = "${pkgs.kitty}/bin/kitty";
      "super + q" = "bspc node -c";
    };
  };


}
