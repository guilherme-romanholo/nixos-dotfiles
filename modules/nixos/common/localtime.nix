{
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}: {
  options = {
    localtime.enable = lib.mkEnableOption "enable localtime";
  };

  config = lib.mkIf config.localtime.enable {
    # Set your time zone.
    time.timeZone = systemSettings.timezone;

    # Select internationalisation properties.
    i18n.defaultLocale = systemSettings.locale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = systemSettings.locale;
      LC_IDENTIFICATION = systemSettings.locale;
      LC_MEASUREMENT = systemSettings.locale;
      LC_MONETARY = systemSettings.locale;
      LC_NAME = systemSettings.locale;
      LC_NUMERIC = systemSettings.locale;
      LC_PAPER = systemSettings.locale;
      LC_TELEPHONE = systemSettings.locale;
      LC_TIME = systemSettings.locale;
    };
  };
}
