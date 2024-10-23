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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    firefox
    alacritty
    rofi-wayland
    discord
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
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
}
