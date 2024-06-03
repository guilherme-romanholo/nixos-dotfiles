{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}: {
  options = {
    libvirt.enable = lib.mkEnableOption "enable libvirt";
  };

  config = lib.mkIf config.libvirt.enable {
    # Enable dconf
    programs.dconf.enable = true;

    # Add user to group
    users.users.${userSettings.username}.extraGroups = ["libvirtd"];

    # Necessary packages
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
    ];

    # Virtualization services
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
    };

    services.spice-vdagentd.enable = true;
  };
}
