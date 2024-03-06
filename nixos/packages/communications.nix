{config, libs, pkgs}:
{
	environment.systemPackages = with pkgs; [
		discord
		teams-for-linux
	];
}
