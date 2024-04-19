{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		firefox
		thunderbird
		libreoffice
	];
}
