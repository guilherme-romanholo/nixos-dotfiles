{
  lib,
  config,
  ...
}: {
  options = {
    grub.enable = lib.mkEnableOption "enable grub";

    grub.device = lib.mkOption {
      type = lib.types.str;
      default = "/dev/sda";
      description = "Grub location disk";
    };

    grub.OSProber = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable OS Prober";
    };
  };

  config = lib.mkIf config.grub.enable {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = config.grub.device;
    boot.loader.grub.useOSProber = config.grub.OSProber;
  };
}
