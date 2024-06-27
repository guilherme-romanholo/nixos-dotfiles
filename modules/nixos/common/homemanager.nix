{
  inputs,
  outputs,
  lib,
  config,
  systemSettings,
  userSettings,
  ...
}: {
  options = {
    homemanager.enable = lib.mkEnableOption "enable homemanger";
  };

  config = lib.mkIf config.homemanager.enable {
    # Home-manager configuration as module
    home-manager = {
      users = {
        ${userSettings.username} = import ../../../profiles/${systemSettings.profile}/home.nix;
      };
      extraSpecialArgs = {
        inherit inputs;
        inherit outputs;
        inherit userSettings;
      };
    };
  };
}
