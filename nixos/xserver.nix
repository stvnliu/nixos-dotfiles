{config, pkgs, ...}:
{
	services.xserver = {
		videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
		displayManager = {
			sessionCommands = ''
			xset r rate 250 50
			xrandr --output HDMI-1 --same-as eDP-1
			dwm-status &
			'';
		};
		windowManager = {
			dwm = {
				enable = true;
			};
		};
	};
}
