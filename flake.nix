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

    # Plasma manager
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  let
    inherit (self) outputs;
    # Libs
    lib = nixpkgs.lib // home-manager.lib;
    # Suported systems for your flake packages, shell, etc.
    suportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forEachSystem = f:
      lib.genAttrs suportedSystems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs suportedSystems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {

    # Code templates module import
    templates = import ./templates;
    # My packages
    packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

    # Hosts modules import
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
