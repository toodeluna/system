{
  description = "My Linux and MacOS system configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    base16.url = "github:SenchoPens/base16.nix";

    tinted-theming-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      lib = import ./lib inputs;
    in
    {
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
      };

      packages = {
        x86_64-linux.plymouth-gif-theme = lib.mkPackage "x86_64-linux" ./packages/plymouth-gif-theme;
      };

      nixosConfigurations = {
        luna-desktop = lib.mkNixosHost "x86_64-linux" "luna-desktop";
      };

      nixosModules = {
        default = import ./nixosModules;
      };
    };
}
