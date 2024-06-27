{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    outputs.nixosModules.common
    outputs.nixosModules.hardware
  ];

  # --- Common Modules --- #
  common.enable = true;
  localtime.timezone = systemSettings.timezone;
  localtime.locale = systemSettings.locale;

  # --- Hardware --- #
  uefi.enable = if (systemSettings.bootmode == "uefi") then true else false; 
  grub.enable = if (systemSettings.bootmode == "grub") then true else false; 
  grub.device = systemSettings.grubDevice;

  environment.systemPackages = with pkgs; [
    neovim
  ];
}
