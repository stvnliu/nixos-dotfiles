{config, lib, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		prismlauncher
		lutris
		heroic
	];
}
