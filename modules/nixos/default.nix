{
  imports = [
    ./nix
    ./hardware
    ./boot
    ./i18n
    ./input
    ./networking
    ./users
    ./fonts
    ./services
    ./programs
    ./theme
  ];

  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = [ ];
  system.stateVersion = "24.05";
}
