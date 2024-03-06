{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		dmenu
		st
	];
}
