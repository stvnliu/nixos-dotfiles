{
	lib,
	pkgs,
	config,
	...
}:
let
	cfg = config.st;
in
{
	options = {
		st.enable = lib.mkEnableOption "Enables st configuration.";
	};
	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			(st.override {
				patches = [
				./patches/custom-config-20240325.diff
				./patches/st-expected-anysize-0.9.diff
				./patches/st-gruvbox-dark-0.8.5.diff
				./patches/st-alpha-osc11-20220222-0.8.5.diff
				./patches/st-scrollback-0.8.5.diff
				];
			})
		];
	};
}
