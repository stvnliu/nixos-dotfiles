{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		dmenu
		(st.override {
			patches = [
			../patches/st/custom-config-20240325.diff
			../patches/st/st-expected-anysize-0.9.diff
			../patches/st/st-gruvbox-dark-0.8.5.diff
			../patches/st/st-alpha-osc11-20220222-0.8.5.diff
			../patches/st/st-scrollback-0.8.5.diff
			];
		})
		slstatus
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
