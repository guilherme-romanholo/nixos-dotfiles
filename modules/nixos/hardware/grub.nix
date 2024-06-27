{
  lib,
  config,
  ...
}: {
  options = {
    grub.enable = lib.mkEnableOption "enable grub";

    grub.disk = lib.mkOption {
      type = lib.types.str;
      default = "/dev/sda";
      description = "Grub location disk";
    };

    grub.OSProber = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable OS Prober";
    };
  };

  config = lib.mkIf config.grub.enable {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = grub.disk;
    boot.loader.grub.useOSProber = grub.OSProber;
  };
}
