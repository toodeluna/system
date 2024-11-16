{ lib, ... }:
let
  mkColorOption =
    name:
    lib.mkOption {
      description = "The color code for ${name}.";
      type = lib.types.strMatching "^([A-Za-z0-9]{6})$";
    };
in
{
  options = {
    syscfg.theme.colorscheme = lib.mkOption {
      description = "The base16 colorscheme to use for the theme.";
      type = lib.types.submodule {
        options = {
          base00 = mkColorOption "base00";
          base01 = mkColorOption "base01";
          base02 = mkColorOption "base02";
          base03 = mkColorOption "base03";
          base04 = mkColorOption "base04";
          base05 = mkColorOption "base05";
          base06 = mkColorOption "base06";
          base07 = mkColorOption "base07";
          base08 = mkColorOption "base08";
          base09 = mkColorOption "base09";
          base0A = mkColorOption "base0A";
          base0B = mkColorOption "base0B";
          base0C = mkColorOption "base0C";
          base0D = mkColorOption "base0D";
          base0E = mkColorOption "base0E";
          base0F = mkColorOption "base0F";
        };
      };
    };
  };
}
