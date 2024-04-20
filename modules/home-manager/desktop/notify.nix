{config, libs, pkgs, ...}:
{
	home.packages = with pkgs; [
		dunst
		libnotify
	];
}
