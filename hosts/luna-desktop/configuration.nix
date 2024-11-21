{ pkgs, colorschemes, ... }:
{
  syscfg = {
    boot = {
      quiet.enable = true;
      plymouth.enable = true;
    };

    hardware = {
      graphics.gpu = "amd";

      monitors = [
        {
          name = "DP-2";
          scale = 1.5;
          resolution = {
            x = 3840;
            y = 2160;
          };
          position = {
            x = 0;
            y = 0;
          };
        }
        {
          name = "DP-1";
          scale = 1.5;
          resolution = {
            x = 3840;
            y = 2160;
          };
          position = {
            x = 2560;
            y = 0;
          };
        }
      ];
    };

    services = {
      ly.enable = true;
      pipewire.enable = true;
    };

    programs = {
      fish.enable = true;
      hyprland.enable = true;
      steam.enable = true;
      discord.enable = true;
      spotify.enable = true;
      stremio.enable = true;
      nh.flake = "/home/luna/Git/toodeluna/system";
    };

    theme = {
      colorscheme = colorschemes.catppuccin-mocha;

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
    rofi-wayland
    zen-browser
    speechd
  ];
}
