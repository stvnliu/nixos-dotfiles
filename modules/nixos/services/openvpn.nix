{inputs, config, ...}:
{
	imports = [ inputs.sops-nix.nixosModules.sops ];
	services.openvpn.servers = {
		nl-1 = {
			autoStart = false;
			config = ''
				config /home/${config.users.users.zhonghengl.name}/openvpn/nl-free-1.ovpn 
			'';
			updateResolvConf = true;
		};
		nl-2 = {
			autoStart = false;
			config = ''
				config /home/${config.users.users.zhonghengl.name}/openvpn/nl-free-2.udp.ovpn 
			'';
			updateResolvConf = true;
		};
		jp = {
			autoStart = false;
			config = ''
				config /home/${config.users.users.zhonghengl.name}/openvpn/jp-free-1.ovpn 
			'';
			updateResolvConf = true;
		};
		us = {
			autoStart = false;
			config = ''
				config /home/${config.users.users.zhonghengl.name}/openvpn/us-free-1.udp.ovpn 
			'';
			updateResolvConf = true;
		};
	};
}
