{lib, ...}:
{
	imports = [
		./development.nix
		./jdk.nix
		./misc.nix
		#./nix-ld.nix
		#./steam.nix
		./tex.nix
		./utils.nix
		./zsh.nix
		./desktop
		./editors
		./terminals
		#./wm
	];
}
