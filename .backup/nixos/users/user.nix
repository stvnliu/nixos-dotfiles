{user}: {config, lib, pkgs, ...}:
{
	users.users.${user} = {
		isNormalUser = true;
		extraGroups = ["wheel" "scanner" "lp"];
		shell = pkgs.zsh;
	};
}
