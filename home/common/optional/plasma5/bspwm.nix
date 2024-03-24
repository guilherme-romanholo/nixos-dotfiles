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
      "ctrl + alt + {Left,Right}" = "bspc desktop -f {prev.local,next.local}";
      "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'";
      "super + f" = "bspc node -t ~fullscreen";
    };
  };


}
