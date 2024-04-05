{ outputs, ... }:

{

  imports = [
    ./console.nix
    ./localtime.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./sound.nix
    ./users.nix
    ./homemanager.nix
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

}
