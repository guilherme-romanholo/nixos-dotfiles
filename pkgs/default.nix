{ pkgs ? import <nixpkgs> { } }: rec {

  sddm-theme = pkgs.callPackage ./sddm-theme.nix { }; 

}
