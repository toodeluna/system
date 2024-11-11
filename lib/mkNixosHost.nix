lib: system: hostName:
let
  defaultConfig = {
    networking.hostName = hostName;

    system = {
      name = hostName;
      stateVersion = "24.05";
    };
  };
in
lib.nixosSystem {
  inherit system;

  modules = [
    defaultConfig
    ../hosts/${hostName}/configuration.nix
    ../hosts/${hostName}/hardware-configuration.nix
  ];
}
