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
        auto-optimise-store = true;
        flake-registry = "";
      };

      optimise.automatic = true;

      # Disable nix channels
      channel.enable = false;

      # Configure nix garbage collector
      gc = {
        automatic = true;
        randomizedDelaySec = "24h";
        options = "--delete-older-than 3d";
      };

      # Add each flake input as a registry
      # To make nix3 commands consistent with the flake
      registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;

      # Add nixpkgs input to NIX_PATH
      # This lets nix2 commands still use <nixpkgs>
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
  };
}
