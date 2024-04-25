{config, libs, pkgs, ...}:
{
	home.packages = with pkgs; [
		
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
	];
}
