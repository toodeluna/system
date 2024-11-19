{ lib, systemConfiguration, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = systemConfiguration.syscfg.programs.fish.enable;

    settings = {
      palette = "base16";
      format = lib.concatStrings [
        "[](base01)"
        "$os"
        "$username"
        "$directory"
        "$git_branch"
        "$time"
        "[](base0b)"
        "$line_break"
        "$character"
      ];

      os = {
        disabled = false;
        style = "bg:base01 fg:base07";
        symbols = {
          NixOS = "󱄅 ";
          Macos = " ";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:base01 fg:base07";
        style_root = "bg:base01 fg:base07";
        format = "[ $user  ]($style)";
      };

      directory = {
        style = "bg:base08 fg:base01";
        format = "[ $path ]($style)";
        home_symbol = "󱂵 ";
        truncation_length = 3;
        truncation_symbol = "󰍻 /";
      };

      git_branch = {
        symbol = "";
        style = "bg:base0a fg:base00";
        format = "[ $symbol $branch ]($style)";
      };

      time = {
        disabled = false;
        style = "bg:base0b fg:base01";
        format = "[ 󰥔 $symbol $time ]($style)";
        use_12hr = true;
      };

      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
        vimcmd_symbol = "[\\$](bold purple)";
        vimcmd_visual_symbol = "[\\$](bold yellow)";
      };

      palettes.base16 = with systemConfiguration.syscfg.theme.colorscheme; {
        base00 = "#${base00}";
        base01 = "#${base01}";
        base02 = "#${base02}";
        base03 = "#${base03}";
        base04 = "#${base04}";
        base05 = "#${base05}";
        base06 = "#${base06}";
        base07 = "#${base07}";
        base08 = "#${base08}";
        base09 = "#${base09}";
        base0a = "#${base0A}";
        base0b = "#${base0B}";
        base0c = "#${base0C}";
        base0d = "#${base0D}";
        base0e = "#${base0E}";
        base0f = "#${base0F}";
      };
    };
  };
}
