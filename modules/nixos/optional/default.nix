{lib, ...}: {
  imports = [
    ./printer.nix
    ./openssh.nix
    ./docker.nix
    ./libvirt.nix
  ];

  printer.enable = lib.mkDefault false;
  openssh.enable = lib.mkDefault false;
  docker.enable = lib.mkDefault false;
  libvirt.enable = lib.mkDefault false;
}
