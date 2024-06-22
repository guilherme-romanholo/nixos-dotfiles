{
  lib,
  config,
  ...
}: {
  imports = [
    ./nixconf.nix
    ./home.nix
    ./git.nix
  ];

  options = {
    common.enable = lib.mkEnableOption "enable common home modules bundle";
  };

  config = lib.mkIf config.common.enable {
    git.enable = lib.mkDefault true;
    nixconf.enable = lib.mkDefault true;
    homeconf.enable = lib.mkDefault true;
  };
}
