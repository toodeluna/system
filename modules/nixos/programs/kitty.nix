{ lib, ... }:
{
  options = {
    syscfg.programs.kitty.enable = lib.mkEnableOption "kitty";
  };
}
