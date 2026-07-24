{
  description = "My system config flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-snapd.url = "github:nix-community/nix-snapd";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nix-snapd, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      whitelotus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/whitelotus/configuration.nix
          nix-snapd.nixosModules.default
          nixos-hardware.nixosModules.framework-16-amd-ai-300-series
        ];
      };
    };
  };
}
