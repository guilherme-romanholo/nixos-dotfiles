{
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./uefi.nix
    ./grub.nix
  ];

  uefi.enable = lib.mkDefault false;
  grub.enable = lib.mkDefault false;
}
