{ lib, systemConfiguration, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = systemConfiguration.syscfg.programs.fish.enable;

    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$line_break"
        "$character"
      ];

      directory = {
        truncation_length = 3;
        truncation_symbol = ".../";
      };

      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
        vimcmd_symbol = "[\\$](bold purple)";
        vimcmd_visual_symbol = "[\\$](bold yellow)";
      };
    };
  };
}
