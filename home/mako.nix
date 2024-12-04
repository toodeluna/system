{ theme, ... }:
{
  services.mako = {
    enable = true;
    icons = true;
    borderSize = 2;
    borderRadius = 5;
    defaultTimeout = 5000;
    padding = "15";
    font = "Work Sans 12";
    backgroundColor = "#${theme.base00}";
    textColor = "#${theme.base05}";
    borderColor = "#${theme.base01}";
  };
}
