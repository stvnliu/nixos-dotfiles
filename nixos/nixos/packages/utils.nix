{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		# System
		wget
		lshw
		hello
		stow
		gparted
		cfdisk
		udiskie
		trash-cli
	];
}
