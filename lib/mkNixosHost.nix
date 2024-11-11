{
  self,
  nixpkgs,
  base16,
  tinted-theming-schemes,
  ...
}:
system: hostName:
let
  defaultConfig = {
    scheme = "${tinted-theming-schemes}/base16/catppuccin-mocha.yaml";
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

  modules = [
    defaultConfig
    base16.nixosModule
    self.nixosModules.default

    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix
  ];
}
