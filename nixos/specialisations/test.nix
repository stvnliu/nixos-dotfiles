{lib, pkgs, config, ...}:
{
	specialisation.test = {
		inheritParentConfig = true;
		configuration = {
			boot.loader.grub.configurationName = "Specialisations Test";
			system.nixos.tags = [ "test" ];
			environment.variables = {
				SPECIALISATIONS_TEST = "ENABLED";
			};
		};
	};
}
