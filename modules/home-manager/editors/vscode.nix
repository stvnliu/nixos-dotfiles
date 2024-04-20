{lib, pkgs, config, ...}:
let
	cfg = config.vscode;
in
{
	options = {
		vscode.enable = lib.mkEnableOption "Enables vscode support with extensions";
	};
	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			(vscode-with-extensions.override {
				vscodeExtensions = with vscode-extensions; [
					bbenoist.nix
					ms-python.python
					ms-vscode-remote.remote-ssh
					vscodevim.vim
					redhat.java
					vscjava.vscode-spring-initializr
				];
			})
		];
	};
}
