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
		./gtk.nix
		./desktop
		./editors
		./terminals
		#./wm
	];
	config = {
		editors = {
			neovim.enable = true;
			vscode.enable = true;
		};
	};
}
