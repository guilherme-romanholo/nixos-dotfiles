{
  description = "My NixOS system config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix colors
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
  let
    inherit (self) outputs;
  in {

    nixosConfigurations = {
      taz = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./system/taz/configuration.nix];
      };

      sunset = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./system/sunset/configuration.nix];
      };
    };

  };
}
