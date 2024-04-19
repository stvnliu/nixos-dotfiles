{user}: {config, libs, pkgs, ...}:
{
	users.users.${user}.programs = {
		discord.enable = true;
		teams-for-linux.enable = true;
	};
}
