{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		shotwell
		kdenlive
		ffmpeg
		firefox
		libreoffice
		thunderbird
		rhythmbox
		spotifywm
		feh
		texlive.combined.scheme-medium
		texstudio
	];
}
