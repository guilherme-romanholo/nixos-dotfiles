{
  description = "Poetry Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    poetry2nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        inherit
          (
            poetry2nix.lib.mkPoetry2Nix {inherit pkgs;}
          )
          mkPoetryApplication
          ;
      in {
        packages = {
          myapp = mkPoetryApplication {
            projectDir = ./project;
            preferWheels = true;
            propagatedBuildInputs = with pkgs; [];
          };
          default = self.packages.${system}.myapp;
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [self.packages.${system}.myapp];
          packages = [pkgs.poetry];
        };
      }
    );
}
