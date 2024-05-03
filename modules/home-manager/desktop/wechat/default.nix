{pkgs, ...}:
{
	home.packages = with pkgs; [
		(wechat-uos.override { uosLicense = ./license.tar.gz; })
	];
}
