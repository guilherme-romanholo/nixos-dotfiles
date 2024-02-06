{ pkgs, config, ... }:

{

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      daemonize = true;
      show-failed-attempts = true;
      clock = true;
      screenshot = true;
      effect-blur="15x15";
      effect-vignette="1:1";
      color="1f1d2e80";
      font="Inter";
      indicator = true;
      indicator-radius=200;
      indicator-thickness=20;
      line-color="${config.colorScheme.palette.base01}";
      ring-color="${config.colorScheme.palette.base00}";
      inside-color="${config.colorScheme.palette.base02}";
      key-hl-color="${config.colorScheme.palette.base0E}";
      separator-color="00000000";
      text-color="${config.colorScheme.palette.base07}";
      text-caps-lock-color="";
      line-ver-color="${config.colorScheme.palette.base0E}";
      ring-ver-color="${config.colorScheme.palette.base0E}";
      inside-ver-color="${config.colorScheme.palette.base02}";
      text-ver-color="${config.colorScheme.palette.base07}";
      ring-wrong-color="${config.colorScheme.palette.base0D}";
      text-wrong-color="${config.colorScheme.palette.base0D}";
      inside-wrong-color="${config.colorScheme.palette.base02}";
      inside-clear-color="${config.colorScheme.palette.base02}";
      text-clear-color="${config.colorScheme.palette.base07}";
      ring-clear-color="${config.colorScheme.palette.base0D}";
      line-clear-color="${config.colorScheme.palette.base01}";
      line-wrong-color="${config.colorScheme.palette.base01}";
      bs-hl-color="${config.colorScheme.palette.base0D}";
      grace=2;
      grace-no-mouse = true;
      grace-no-touch = true;
      datestr="%a, %B %e";
      timestr="%I:%M %p";
      fade-in=0.3;
      ignore-empty-password = true;
    };
  };

}
