{ pkgs ? import <nixpkgs> { } }: {

  sddm-theme = pkgs.callPackage ./sddm-theme.nix { inherit pkgs; }; 

}
