{config, lib, pkgs, ...}:
{
	home.packages = with pkgs; [
		# launchers
		prismlauncher
		lutris
		heroic
		
		# linux games
		torcs
		flightgear
		openttd
		openttd-jgrpp
	];
}
