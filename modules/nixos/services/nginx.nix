{pkgs, ...}: {
  services.nginx = {
    enable = true;
    virtualHosts."localhost" = {
      root = "/var/www/localhost";
      locations = {
        "/" = {
          root = "/srv/public";
          extraConfig = ''
            autoindex on;
          '';
        };
      };
      listenAddresses = [
        "127.0.0.1"
        "[::1]"
      ];
    };
  };
  networking.firewall.allowedTCPPorts = [80];
}
