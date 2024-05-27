{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.steamModule;
in {
  options.steamModule = {
    enable = lib.mkEnableOption "Enables steam support.";
    openFirewalls = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Opens firewalls for steam functions, e.g. dedicated servers.";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = lib.mkIf cfg.openFirewalls true;
      localNetworkGameTransfers.openFirewall = lib.mkIf cfg.openFirewalls true;
      dedicatedServer.openFirewall = lib.mkIf cfg.openFirewalls true;
    };
  };
}
