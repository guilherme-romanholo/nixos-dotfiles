{ pkgs }:

let 
  image = ../home/common/files/wallpapers/gruvbox/gruv_village.png;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    rm $out/Background.jpg
    sed -i 's/ForceHideCompletePassword=false/ForceHideCompletePassword=true/' $out/theme.conf
    cp -r ${image} $out/Background.jpg
  '';

}

