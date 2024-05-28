{
  pkgs,
  config,
  lib,
  ...
}: {
  services = {
    syncthing = {
      enable = true;
      user = "zhonghengl";
      dataDir = "/home/zhonghengl/Documents";
      configDir = "/home/zhonghengl/Documents/.config/syncthing";
    };
  };
  networking.firewall.allowedTCPPorts = [8384 22000];
  networking.firewall.allowedUDPPorts = [22000 21027];
}
