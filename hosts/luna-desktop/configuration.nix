{ pkgs, ... }:
let
  system-name = "luna-desktop";
in
{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.name = system-name;
  system.stateVersion = "24.05";

  networking.hostName = system-name;
  networking.firewall.enable = true;

  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  security.sudo.extraConfig = "Defaults env_reset,pwfeedback";
  console.useXkbConfig = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.luna = import ./home.nix;
  };

  fonts.packages = with pkgs; [
    iosevka-custom
  ];

  users.users.luna = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Luna Heyman";
    extraGroups = [ "wheel" ];
  };

  services.displayManager.ly = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb = {
      layout = "us";
      options = "caps:escape";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
}
