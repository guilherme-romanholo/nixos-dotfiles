{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    printer.enable = lib.mkEnableOption "enable printer";
  };

  config = lib.mkIf config.printer.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Printer drivers
    services.printing.drivers = [pkgs.gutenprint];

    # Enable printer scanner
    hardware.sane.enable = true;

    # Enable network printer discover
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
