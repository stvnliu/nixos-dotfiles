{pkgs, ...}:
{
	services.nginx = {
		enable = true;
		virtualHosts."localhost" = {
			root = "/var/www/localhost";
		};
	};
	networking.firewall.allowedTCPPorts = [ 80 ];
}
