{ pkgs, ... }:
{
  syscfg = {
    boot = {
      quiet.enable = true;
      plymouth.enable = true;
    };

    hardware = {
      graphics.gpu = "amd";
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
      kitty.enable = true;
      nh.flake = "/home/luna/Git/toodeluna/system";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    rofi-wayland
    zen-browser
    speechd
  ];
}
