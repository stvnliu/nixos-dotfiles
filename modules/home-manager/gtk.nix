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
			package = pkgs.dejavu_fonts;
			name = "Dejavu Serif";
			size = 12;
		};
		iconTheme = {
			package = pkgs.libsForQt5.breeze-icons;
			name = "Breeze";
		};
		theme = {
			package = pkgs.libsForQt5.breeze-gtk;
			name = "Breeze";
		};
	};
	qt = {
		enable = true;
		platformTheme = "qtct";
		# style = {
		#   package = pkgs.libsForQt5.breeze-qt5;
		#   name = "breeze";
		# };
	};
	home.packages = with pkgs; [
		libsForQt5.breeze-qt5
	];
}
