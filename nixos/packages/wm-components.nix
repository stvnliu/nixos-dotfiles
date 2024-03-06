{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		dmenu
		st
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
