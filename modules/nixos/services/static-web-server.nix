{pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		static-web-server
	];
	services.static-web-server = {
		enable = true;
		listen = "[::]:81";
		root = "/srv/public";
		configuration = {
			general = {
				directory-listing = false;
				#directory-listing = true;
			};
		};
	};
	networking.firewall.allowedTCPPorts = [ 81 ];
}
