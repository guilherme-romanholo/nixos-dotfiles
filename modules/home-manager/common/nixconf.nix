{
  outputs,
  lib,
  config,
  ...
}: {
  options = {
    nixconf.enable = lib.mkEnableOption "enable nix home configs";
  };

  config = lib.mkIf config.nixconf.enable {
    # Nixpkgs for home system
    nixpkgs = {
      overlays = [
        outputs.overlays.additions
        outputs.overlays.modifications
        outputs.overlays.unstable-packages
      ];
      config = {
        allowUnfree = true;
      };
    };
  };
}
