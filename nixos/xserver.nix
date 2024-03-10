{config, pkgs, ...}:
{
	services.xserver = {
		videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
		displayManager = {
			sessionCommands = ''
			xset r rate 250 50
			xrandr --output HDMI-1 --same-as eDP-1
			feh --bg-scale ~/wallpaper.png
			slstatus &
			'';
		};
		windowManager = {
			dwm = {
				enable = true;
				package = pkgs.dwm.override {
					patches = [
						./patches/dwm/dwm-flextile-20210722-138b405.diff
						./patches/dwm/dwm-systray-6.4.diff
					];
				};
			};
		};
	};
}
