{ lib, ... }:
let
  coordType = lib.types.submodule {
    options = {
      x = lib.mkOption {
        description = "The X value of the coordinate.";
        type = lib.types.int;
      };

      y = lib.mkOption {
        description = "The Y value of the coordinate.";
        type = lib.types.int;
      };
    };
  };
in
{
  options = {
    syscfg.hardware.monitors = lib.mkOption {
      description = "The list of monitors.";
      type = lib.types.listOf (
        lib.types.submodule {
          options = {
            name = lib.mkOption {
              description = "The name of the monitor.";
              example = "DP-0";
              type = lib.types.str;
            };

            resolution = lib.mkOption {
              description = "The resolution of the monitor.";
              type = coordType;
            };

            position = lib.mkOption {
              description = "The position of the monitor.";
              type = coordType;
            };

            scale = lib.mkOption {
              description = "The scale factor of the monitor.";
              type = lib.types.float;
            };
          };
        }
      );
    };
  };
}
