{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.dwm;
in {
  options = {
    dwm.enable = lib.mkEnableOption "Enables dwm.";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [dmenu slstatus];
    programs.dconf.enable = true;
    services.xserver = {
      windowManager = {
        dwm = {
          enable = true;
          package = pkgs.dwm.override {
            patches = [
              ./patches/config-20240325.diff
              ./patches/dwm-flextile-20210722-138b405.diff
              ./patches/dwm-systray-6.4.diff
            ];
          };
        };
      };
    };
  };
}
