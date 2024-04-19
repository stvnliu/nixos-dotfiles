{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		
		# System flair and random stuff
		neofetch
		lolcat
		cmatrix
	];
}
