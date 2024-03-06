{pkgs, ...}:
{
	pkgs.writeShellScriptBin "nixos-deploy" ''
		echo "Running nixos-deploy script..."
		cd ~/dotfiles/nixos/
		sudo ${pkgs.stow}/bin/stow . -t /etc/nixos/
		sudo nixos-rebuild switch
		GEN=`readlink /nix/var/nix/profiles/system | cut -d- -f2`
		${pkgs.git}/bin/git add -A
		${pkgs.git}/bin/git commit -m "${date +"%D::%H:%M:%S"} NixOS Gen ${GEN}"
	''
}
