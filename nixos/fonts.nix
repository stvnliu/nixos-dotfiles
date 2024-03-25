{pkgs, config, lib, ...}:
{
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		mplus-outline-fonts.githubRelease
		dina-font
		proggyfonts
		(
			nerdfonts.override {
				fonts = [
					"FiraCode"
					"IBMPlexMono"
					"IntelOneMono"
				];
			} 
		)
];
}

