{
  self,
  nixpkgs,
  home-manager,
  nixvim,
  ...
}:
system: hostName:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    colorschemes = import ../colorschemes;
  };

  modules = [
    self.nixosModules.default
    home-manager.nixosModules.home-manager

    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix

    {
      networking.hostName = hostName;
      system.name = hostName;
      nixpkgs.overlays = [ (_: _: self.packages.${system}) ];
      home-manager.users.luna = {
        imports = [
          self.homeManagerModules.default
          nixvim.homeManagerModules.nixvim
        ];
      };
    }
  ];
}
