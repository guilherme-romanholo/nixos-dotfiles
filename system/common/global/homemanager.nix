
{ inputs, outputs, config, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      guilherme = import ../../../home/${config.networking.hostName}.nix;
    };
  };

}
