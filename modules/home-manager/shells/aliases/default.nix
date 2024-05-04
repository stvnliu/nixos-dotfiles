{ pkgs }: {
	ls = "${pkgs.eza}/bin/exa";
	cat = "${pkgs.bat}/bin/bat";
	ll = "ls -l";
	osupdate = "${pkgs.nh}/bin/nh os switch";
	homeupdate = "${pkgs.nh}/bin/nh home switch -- --impure";
	batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
}
