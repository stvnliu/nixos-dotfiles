{pkgs, ...}:
{
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		mplus-outline-fonts.githubRelease
		dina-font
		proggyfonts
		glasstty-ttf
		(
			nerdfonts.override {
				fonts = [
					"FiraCode"
					"IBMPlexMono"
					"IntelOneMono"
					"CascadiaMono"
					"CommitMono"
					"JetBrainsMono"
				];
			} 
		)
];
}

