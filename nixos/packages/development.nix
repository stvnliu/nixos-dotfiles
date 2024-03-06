{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		nodejs
		vscode-with-extensions
	];
}
