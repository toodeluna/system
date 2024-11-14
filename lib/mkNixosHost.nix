{
  self,
  nixpkgs,
  ...
}:
system: hostName:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    colorscheme = import ../data/colorscheme.nix;
  };

  modules = [
    self.nixosModules.default
    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix
    {
      networking.hostName = hostName;
      system.name = hostName;
      nixpkgs.overlays = [ (_: _: self.packages.${system}) ];
    }
  ];
}
