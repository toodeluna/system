{
  self,
  nixpkgs,
  ...
}:
system: hostName:
let
  defaultConfig = {
    networking.hostName = hostName;

    system = {
      name = hostName;
      stateVersion = "24.05";
    };

    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        (_: _: self.packages.${system})
      ];
    };
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    colorscheme = import ../data/colorscheme.nix;
  };

  modules = [
    defaultConfig
    self.nixosModules.default

    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix
  ];
}
