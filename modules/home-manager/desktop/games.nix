{config, lib, pkgs, ...}:
{
	home.packages = with pkgs; [
		prismlauncher
		lutris
		heroic
		torcs
		flightgear
	];
}
