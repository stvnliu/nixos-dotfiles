{pkgs, ...}:
{
	services.xserver = {
		enable = true;
		# 24.05 unstable
		xkb = {
			layout = "us";
			variant = "";
		};
	};
}
