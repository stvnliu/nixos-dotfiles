{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		dmenu
		st
		slstatus
		dunst
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
