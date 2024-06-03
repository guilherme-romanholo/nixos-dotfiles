{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}: {
  options = {
    docker.enable = lib.mkEnableOption "enable docker";
  };

  config = lib.mkIf config.docker.enable {
    # Enable dconf
    programs.dconf.enable = true;

    # Add user to group
    users.users.${userSettings.username}.extraGroups = ["docker"];

    # Necessary packages
    environment.systemPackages = with pkgs; [
      docker
      docker-compose
    ];

    # Virtualization services
    virtualisation.docker.enable = true;
  };
}
