{
  lib,
  config,
  systemSettings,
  userSettings,
  ...
}: {
  options = {
    network.enable = lib.mkEnableOption "enable network";
  };

  config = lib.mkIf config.network.enable {
    # Config hostname
    networking.hostName = systemSettings.hostname;

    # Enable networking
    networking.networkmanager.enable = true;

    # Extra hosts
    networking.extraHosts = ''
      127.0.0.1 localhost
      ::1 localhost
    '';

    # Add user to group
    users.users.${userSettings.username}.extraGroups = ["networkmanager"];
  };
}
