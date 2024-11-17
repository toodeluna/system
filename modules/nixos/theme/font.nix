{ pkgs, lib, ... }:
let
  mkFontOption =
    category:
    lib.mkOption {
      description = "The ${category} font to use.";

      type = lib.types.submodule {
        options = {
          package = lib.mkPackageOption pkgs "font" { };

          name = lib.mkOption {
            description = "The name of the font";
            type = lib.types.str;
          };
        };
      };
    };
in
{
  options = {
    syscfg.theme.fonts.monospace = mkFontOption "monospace";
    syscfg.theme.fonts.gui = mkFontOption "gui";
  };
}
