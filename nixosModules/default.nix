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

  environment.defaultPackages = [ ];
}
