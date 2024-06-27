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

  # --- Hardware --- #
  uefi.enable = if (systemSettings.bootmode == "uefi") then true else false; 
  grub.enable = if (systemSettings.bootmode == "grub") then true else false; 
  grub.disk = systemSettings.grubDevice;

  environment.systemPackages = with pkgs; [
    neovim
  ];
}
