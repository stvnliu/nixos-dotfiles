{pkgs, ...}:
{
	config = {
		specialisation.powersave = {
			
			configuration = {
				boot.loader.grub.configurationName = "Power-saving mode";
				system.nixos.tags = [ "powersave" ];
			};
		};
	};
}
