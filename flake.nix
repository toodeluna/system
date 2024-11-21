{
  description = "My Linux and MacOS system configurations in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    zen-browser = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        x86_64-linux.plymouth-gif-theme = lib.mkPackage "x86_64-linux" ./packages/plymouth-gif-theme.nix;
        x86_64-linux.zen-browser = inputs.zen-browser.packages.x86_64-linux.generic;
      };

      nixosConfigurations = {
        luna-desktop = lib.mkNixosHost "x86_64-linux" "luna-desktop";
        luna-laptop = lib.mkNixosHost "x86_64-linux" "luna-laptop";
      };

      nixosModules = {
        default = import ./modules/nixos;
      };

      homeManagerModules = {
        default = import ./modules/home;
      };
    };
}
