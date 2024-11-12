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
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    kitty
    rofi-wayland
    zen-browser
    speechd
  ];
}
