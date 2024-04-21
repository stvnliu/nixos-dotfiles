{...}:
{
	services.openvpn.servers = {
		nl = {
			config = '' config /home/zhonghengl/openvpn/nl-free-1.ovpn '';
			updateResolvConf = true;
		};
	};
}
