{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		# System
		wget
		lshw
		hello
		stow
		gparted
		util-linux
		udiskie
		trash-cli
	];
}
