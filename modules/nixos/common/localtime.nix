{
  lib,
  config,
  ...
}: {
  options = {
    localtime.enable = lib.mkEnableOption "enable localtime";

    localtime.timezone = lib.mkOption {
      type = lib.types.str;
      default = "America/Sao_Paulo";
      description = "System timezone";
    };

    localtime.locale = lib.mkOption {
      type = lib.types.str;
      default = "pt_BR.UTF-8";
      description = "System locale";
    };

    localtime.consoleKeymap = lib.mkOption {
      type = lib.types.str;
      default = "br-abnt2";
      description = "System console keymap";
    };
  };

  config = lib.mkIf config.localtime.enable {
    # Set your time zone.
    time.timeZone = config.localtime.timezone;

    # Select internationalisation properties.
    i18n.defaultLocale = config.localtime.locale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = config.localtime.locale;
      LC_IDENTIFICATION = config.localtime.locale;
      LC_MEASUREMENT = config.localtime.locale;
      LC_MONETARY = config.localtime.locale;
      LC_NAME = config.localtime.locale;
      LC_NUMERIC = config.localtime.locale;
      LC_PAPER = config.localtime.locale;
      LC_TELEPHONE = config.localtime.locale;
      LC_TIME = config.localtime.locale;
    };

    # Configure console keymap
    console.keyMap = "br-abnt2";
  };
}
