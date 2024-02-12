{ config, pkgs, ... }:

{
  # Enable dconf
  programs.dconf.enable = true;

  # Add user to group
  users.users.guilherme.extraGroups = [ "docker" ];

  # Necessary packages
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  # Virtualization services
  virtualisation.docker.enable = true;

}
