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
					patches = with pkgs; [
						(fetchpatch {
							url = "https://dwm.suckless.org/patches/flextile/dwm-flextile-20210722-138b405.diff";
							sha256 = "005f2j38dkygc15c8531i4b0ixjxy1a9bl6a3wa0ac570ikhi9lg";
						})
					];
				};
			};
		};
	};
}
