{user}: {config, libs, pkgs, ...}:
{
	users.users.${user}.programs = {
		htop.enable = true;
	};
}
