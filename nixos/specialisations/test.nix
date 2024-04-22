{lib, pkgs, config, ...}:
{
	specialisation.test = {
		inheritParentConfig = true;
		configuration = {
			system.nixos.tags = [ "test" ];
			environment.variables = {
				SPECIALISATIONS_TEST = "ENABLED";
			};
		};
	};
}
