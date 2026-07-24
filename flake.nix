{
  description = "My system config flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-snapd.url = "github:nix-community/nix-snapd";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nix-snapd, ... }:
  {
    nixosConfigurations = {
      whitelotus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/whitelotus/configuration.nix

          nix-snapd.nixosModules.default
          nixos-hardware.nixosModules.framework-16-amd-ai-300-series

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.silas =
              import ./home/default.nix;
          }
        ];
      };
    };
  };
}
