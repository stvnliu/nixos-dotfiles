{pkgs, ...}:
{
	services.xserver = {
		enable = true;
		# 24.05 unstable
		dpi = 100;
		videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
		displayManager = {
			sessionCommands = ''
				xset r rate 250 50
				xrandr --output HDMI-1 --same-as eDP-1
				${pkgs.feh}/bin/feh --bg-scale ~/wallpaper.png
				${pkgs.slstatus}/bin/slstatus &
				${pkgs.fcitx5}/bin/fcitx5 &
				mpris-proxy &
				udiskie &
				'';
		};
		xkb = {
			layout = "us";
			variant = "";
		};
	};
}
