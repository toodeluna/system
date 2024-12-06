{
  description = "My Linux and MacOS system configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      theme = import ./theme.nix;

      mkPackage = system: path: nixpkgs.legacyPackages.${system}.callPackage (import path) { };

      mkNixosHost =
        system: hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit hostName theme inputs;
          };

          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./hosts/${hostName}/configuration.nix
            ./hosts/${hostName}/hardware-configuration.nix
            { nixpkgs.overlays = [ (_: _: self.packages.${system}) ]; }
          ];
        };
    in
    {
      formatter = {
        x86_64-linux = self.packages.x86_64-linux.treefmt-custom;
      };

      packages = {
        x86_64-linux.treefmt-custom = mkPackage "x86_64-linux" ./pkgs/treefmt-custom.nix;
        x86_64-linux.plymouth-gif-theme = mkPackage "x86_64-linux" ./pkgs/plymouth-gif-theme.nix;
      };

      nixosConfigurations = {
        luna-desktop = mkNixosHost "x86_64-linux" "luna-desktop";
      };
    };
}
