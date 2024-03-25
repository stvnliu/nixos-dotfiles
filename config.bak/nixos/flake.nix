{
    description = "NixOS config";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = inputs @ {self, nixpkgs, home-manager, ...} :
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {
            nixosConfigurations.default = nixpkgs.lib.nixosSystem {
                extraSpecialArgs = {inherit inputs;};
		modules = [
                    ./configuration.nix
                ];
            };
            homeConfigurations = {
                default = home-manager.lib.homeManagerConfiguration {
		    extraSpecialArgs = {inherit inputs;};
                    pkgs = nixpkgs.legacyPackages.${system};
                    modules = [
                        ./home-manager/home.nix
                    ];
                };
            };
        };
}
