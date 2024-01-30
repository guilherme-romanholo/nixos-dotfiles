{
  description = "My NixOS system config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  let
    inherit (self) outputs;
  in {

    nixosConfigurations = {
      taz-workstation = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./system/acme/configuration.nix];
      };
    };

    homeConfigurations = {
      "guilherme@taz-workstation" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/acme/home.nix];
      };
    };

  };
}
