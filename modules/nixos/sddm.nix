{pkgs, ...}: {
	environment.systemPackages = with pkgs; [
		(where-is-my-sddm-theme.override {
		 	themeConfig.General = {
		 	background = "./login.jpg";
		 	backgroundMode = "fill";
		 	};
		 }
		)
	];
}
