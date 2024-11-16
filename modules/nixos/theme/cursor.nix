{ pkgs, lib, ... }:
{
  options = {
    syscfg.theme.cursor.package = lib.mkPackageOption pkgs "cursor theme" { };

    syscfg.theme.cursor.name = lib.mkOption {
      description = "The name of the cursor theme to use.";
    };
  };
}
