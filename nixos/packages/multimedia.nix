{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		shotwell
		kdenlive
		ffmpeg
		firefox
		libreoffice
	];
}
