{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.services.ly.enable = lib.mkEnableOption "ly display manager";
  };

  config = lib.mkIf config.syscfg.services.ly.enable {
    services.displayManager =
      let
        backgroundColor = config.syscfg.theme.colorscheme.base00;
        preStartScript = "${pkgs.coreutils}/bin/printf '%%b\\e]P0${backgroundColor}\\e]P7FFFFFF\\ec'";
      in
      {
        preStart = preStartScript;

        ly = {
          enable = true;
          settings = {
            vi_mode = true;
            clear_password = true;
            clock = "%D %H:%M";
            term_reset_cmd = "${pkgs.ncurses}/bin/tput reset; ${preStartScript}";
          };
        };
      };
  };
}
