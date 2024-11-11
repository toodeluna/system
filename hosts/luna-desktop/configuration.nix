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
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    firefox
    kitty
    rofi-wayland
    zen-browser
    speechd
  ];
}
