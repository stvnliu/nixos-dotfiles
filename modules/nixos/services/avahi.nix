{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.serviceModules.avahi;
in {
  options.serviceModules.avahi = {
    enable = lib.mkEnableOption "Enables avahi network auto-discovery.";
  };
  config = lib.mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };
}
