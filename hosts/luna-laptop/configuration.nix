{ pkgs, colorschemes, ... }:
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
      nh.flake = "/home/luna/Git/toodeluna/system";
    };

    theme = {
      colorscheme = colorschemes.onedark;

      cursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };

      fonts = {
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        };

        gui = {
          name = "Work Sans";
          package = pkgs.work-sans;
        };
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
