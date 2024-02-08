
{

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    networkmanager.enable = true;
#    extraHosts = ''
#      200.145.216.180 pdns.acmesecurity.org
#      200.145.216.180 grafana.pdns.acmesecurity.org
#    '';
  };



}
