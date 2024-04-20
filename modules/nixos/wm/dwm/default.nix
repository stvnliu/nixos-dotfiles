{config, lib, pkgs, ...}:
let
	cfg = config.dwm;
in
{
	options = {
		dwm.enable = lib.mkEnableOption "Enables dwm.";
	};
	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [ dmenu slstatus ];
		services.xserver = {
			videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
			displayManager = {
				sessionCommands = ''
					xset r rate 250 50
					xrandr --output HDMI-1 --same-as eDP-1
					${pkgs.feh}/bin/feh --bg-scale ~/wallpaper.png
					${pkgs.slstatus}/bin/slstatus &
					${pkgs.fcitx5}/bin/fcitx5 &
					mpris-proxy &
					'';
			};
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
