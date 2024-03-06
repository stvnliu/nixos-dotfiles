{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		neofetch
		sl
		lolcat
		cmatrix
	];
}
