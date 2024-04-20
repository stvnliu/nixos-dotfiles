{config, libs, pkgs, ...}:
{
	home.packages = with pkgs; [
		dunst
		libnotify
		(
		where-is-my-sddm-theme.override {
		 	themeConfig.General = {
		 	background = "./login.jpg";
		 	backgroundMode = "fill";
		 	};
		 }
		)

	];
}
