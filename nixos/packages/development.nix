{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		nodejs
		python3
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
		maven
		lunarvim
	];
}
