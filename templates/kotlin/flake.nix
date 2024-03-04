{
  description = "Kotlin Develop Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in 
      {
        devShells.default =
          pkgs.mkShell
            {
              nativeBuildInputs = with pkgs; [
                gradle
                openjdk
                kotlin
                jetbrains.idea-ultimate
              ];
            };
      }
    );
}
