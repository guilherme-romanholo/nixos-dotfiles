{lib, ...}: {
  imports = [
    ./gnomeconf.nix
  ];

  gnomeconf.enable = lib.mkDefault false;
}
