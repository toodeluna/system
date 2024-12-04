{
  pkgs,
  config,
  hostName,
  theme,
  ...
}:
{
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  console.useXkbConfig = true;
  security.sudo.extraConfig = "Defaults env_reset,pwfeedback";
  networking.hostName = hostName;

  programs.fish.enable = true;
  programs.gamemode.enable = true;

  system = {
    name = hostName;
    stateVersion = "24.05";
  };

  boot = {
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    initrd = {
      verbose = false;
      kernelModules = [ "amdgpu" ];
    };

    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = rec {
      enable = true;
      theme = "plymouth-gif-theme";
      themePackages = [ pkgs.${theme} ];
    };
  };

  environment = {
    defaultPackages = [ ];

    systemPackages = with pkgs; [
      ncpamixer
      firefox
      discord
      spotify
      r2modman
      neovim
      nautilus
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };

  users = {
    defaultUserShell = pkgs.fish;

    users.luna = {
      isNormalUser = true;
      description = "Luna Heyman";
      extraGroups = [ "wheel" ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hmbackup";
    users.luna = import ./home.nix;

    extraSpecialArgs = {
      inherit theme;
      systemConfiguration = config;
    };
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = "nix-command flakes";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  fonts.packages = with pkgs; [
    work-sans
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];

  services.xserver = {
    videoDrivers = [ "amdgpu" ];

    xkb = {
      layout = "us";
      options = "caps:escape";
    };
  };

  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.displayManager = rec {
    preStart = "${pkgs.coreutils}/bin/printf '%%b\\e]P0${theme.base00}\\e]P7FFFFFF\\ec'";

    ly = {
      enable = true;

      settings = {
        vi_mode = true;
        clear_password = true;
        clock = "%D %H:%M";
        term_reset_cmd = "${pkgs.ncurses}/bin/tput reset; ${preStart}";
      };
    };
  };

  programs.nh = {
    enable = true;
    flake = "/home/luna/system";
    clean.enable = true;
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
  };
}
