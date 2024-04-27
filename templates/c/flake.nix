{

  description = "C project template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
	inherit system;
	# config.allowUnfree = true;
      };
    in 
    {
      devShells.x86_64-linux.default = 
	pkgs.mkShell
	  {
	    nativeBuildInputs = with pkgs; [
	      gcc
	      cmake
	      # jetbrains.clion
	    ];
	  };
    };

}
