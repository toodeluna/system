{ pkgs, ... }:
{
  syscfg = {
    boot = {
      quiet.enable = true;
      plymouth.enable = true;
    };

    hardware = {
      graphics.gpu = "intel";
    };

    networking = {
      wireless.enable = true;
    };

    services = {
      ly.enable = true;
      pipewire.enable = true;
    };

    programs = {
      fish.enable = true;
      hyprland.enable = true;
      discord.enable = true;
      spotify.enable = true;
      kitty.enable = true;
      nh.flake = "/home/luna/Git/toodeluna/system";
    };

    theme = {
      colorscheme = import ../../data/colorscheme.nix;

      cursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    rofi-wayland
    zen-browser
    speechd
  ];
}
