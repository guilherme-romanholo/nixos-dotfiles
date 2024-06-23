{
  lib,
  config,
  ...
}: {
  imports = [
    ./localtime.nix
    ./nixconf.nix
    ./homemanager.nix
    ./user.nix
    ./audio.nix
    ./network.nix
  ];

  options = {
    common.enable = lib.mkEnableOption "enable common modules bundle";
  };

  config = lib.mkIf config.common.enable {
    localtime.enable = lib.mkDefault true;
    nixconf.enable = lib.mkDefault true;
    homemanager.enable = lib.mkDefault true;
    user.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    network.enable = lib.mkDefault true;
  };
}
