{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./avahi.nix
    ./misc.nix
    ./openvpn.nix
    ./pipewire.nix
    ./printing.nix
    ./static-web-server.nix
  ];
  serviceModules = {
    avahi = {
      enable = true;
    };
  };
}
