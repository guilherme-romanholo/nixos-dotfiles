{
  inputs,
  outputs,
  lib,
  config,
  systemSettings,
  userSettings,
  ...
}: {
  options = {
    uefi.enable = lib.mkEnableOption "enable uefi";
  };

  config = lib.mkIf config.uefi.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
