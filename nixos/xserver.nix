{config, pkgs, ...}:
{
	services.xserver = {
		videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
		displayManager = {
			sessionCommands = ''xset r rate 250 50'';
		};
		windowManager = {
			dwm = {
				enable = true;
				package = pkgs.dwm.override {
					conf = ./config.h
				}
			};
		};
	};
}
