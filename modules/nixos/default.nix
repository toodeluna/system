{
  imports = [
    ./nix
    ./hardware
    ./boot
    ./i18n
    ./input
    ./users
    ./fonts
    ./services
    ./programs
  ];

  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = [ ];
  system.stateVersion = "24.05";
}
