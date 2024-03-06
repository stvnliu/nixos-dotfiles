{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		neofetch
		lolcat
		cmatrix
	];
}
