{ lib, config, ... }:
{
  options = {
    syscfg.boot.quiet.enable = lib.mkEnableOption "quiet boot";
  };

  config = {
    boot = lib.mkIf config.syscfg.boot.quiet.enable {
      consoleLogLevel = 0;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
    };
  };
}
