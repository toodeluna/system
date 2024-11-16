{
  self,
  nixpkgs,
  home-manager,
  ...
}:
system: hostName:
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    self.nixosModules.default
    home-manager.nixosModules.home-manager

    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix

    {
      networking.hostName = hostName;
      system.name = hostName;
      nixpkgs.overlays = [ (_: _: self.packages.${system}) ];
      home-manager.users.luna = self.homeManagerModules.default;
    }
  ];
}
