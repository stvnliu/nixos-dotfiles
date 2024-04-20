{lib, pkgs, config, ...}:
{
	imports = [
		./st.nix
	];
	st.enable = true;
}
