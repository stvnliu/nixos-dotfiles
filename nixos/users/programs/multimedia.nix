{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		
		# Picture management
		shotwell
		feh
		
		# Video editing and playback
		kdenlive
		ffmpeg
		mpv
		yt-dlp
		
		# Local and spotify-based cloud music
		rhythmbox
		spotifywm
	];
}
