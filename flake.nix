{
  description = "My Linux and MacOS system configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }@inputs:
    let
      lib = import ./lib inputs;
    in
    {
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
      };

      nixosConfigurations = {
        luna-desktop = lib.mkNixosHost "x86_64-linux" "luna-desktop";
      };

      nixosModules = {
        default = import ./nixosModules;
      };
    };
}
