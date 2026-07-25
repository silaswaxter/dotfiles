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

    catppuccin.url = "github:catppuccin/nix/release-26.05";
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, nixos-hardware, nix-snapd, ... }:
  {
    nixosConfigurations = {
      whitelotus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # System modules
          ./hosts/whitelotus/configuration.nix
          nix-snapd.nixosModules.default
          nixos-hardware.nixosModules.framework-16-amd-ai-300-series
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager

          # Homemanager Config
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.silas = {
              imports = [
                ./home/default.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
  };
}
