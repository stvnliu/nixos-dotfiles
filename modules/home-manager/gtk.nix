{pkgs, config, ...}:
{
	gtk = {
		enable = true;
		cursorTheme = {
			package = pkgs.vanilla-dmz;
			name = "Vanilla-DMZ";
			size = 24;
		};
		font = {
			name = "CaskaydiaMono Nerd Font ExtraLight";
			size = 10;
		};
		theme = {
			package = pkgs.kanagawa-gtk-theme;
			name = "Kanagawa-B";
		};
		iconTheme = {
			package = pkgs.kanagawa-icon-theme;
			name = "Kanagawa";
		};
	};
	qt = {
		enable = true;
		platformTheme = "gtk";
		style = {
		   package = pkgs.libsForQt5.breeze-qt5;
		   name = "breeze";
		};
	};
	home.packages = with pkgs; [
		libsForQt5.breeze-qt5
	];
}
