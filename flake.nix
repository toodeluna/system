{
  description = "My Nix and Mac OS configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-homebrew,
    }:
    let
      pkgs = {
        x86_64-linux = import nixpkgs {
          system = "x86_64-linux";
          overlays = import ./overlays;
          config.allowUnfree = true;
        };

        aarch64-darwin = import nixpkgs {
          system = "aarch64-darwin";
          overlays = import ./overlays;
          config.allowUnfree = true;
        };
      };
    in
    {
      formatter.x86_64-linux = pkgs.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-darwin = pkgs.aarch64-darwin.nixfmt-rfc-style;

      nixosConfigurations.luna-desktop = nixpkgs.lib.nixosSystem (rec {
        system = "x86_64-linux";

        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/luna-desktop/configuration.nix
        ];

        specialArgs = {
          pkgs = pkgs."${system}";
        };
      });

      darwinConfigurations.luna-macbook = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
          ./hosts/luna-macbook/configuration.nix
        ];

        specialArgs = {
          inherit self;
          pkgs = pkgs.aarch64-darwin;
        };
      };
    };
}
