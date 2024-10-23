{
  description = "My Nix and Mac OS configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = {
        x86_64-linux = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
    in
    {
      formatter.x86_64-linux = pkgs.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.luna-desktop = nixpkgs.lib.nixosSystem (rec {
        system = "x86_64-linux";
        modules = [ ./hosts/luna-desktop/configuration.nix ];
        specialArgs = {
          pkgs = pkgs."${system}";
        };
      });
    };
}
