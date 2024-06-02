{
  inputs,
  outputs,
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}: {
  options = {
    nixconf.enable = lib.mkEnableOption "enable nix configs";
  };

  config = lib.mkIf config.nixconf.enable {
    # Nixpkgs for global system
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

    # Nix system configurations
    nix = let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
      };
      channel.enable = false;
      registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
  };
}
