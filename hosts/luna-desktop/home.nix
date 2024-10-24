{ config, pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  home.packages = with pkgs; [
    discord
  ];

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  programs.firefox.enable = true;
  programs.bat.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      q = "exit";
      cls = "clear";
      vim = "nvim";
      cat = "bat";
      ls = "lsd";
      tree = "lsd --tree";
      collect-garbage = "sudo nix-collect-garbage --delete-old";
    };
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
  };

  programs.lsd = {
    enable = true;
    settings = {
      sorting.dir-grouping = "first";
      date = "+%d/%m/%Y %H:%M";
      blocks = [
        "permission"
        "user"
        "date"
        "name"
        "size"
        "git"
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "Luna Heyman";
    userEmail = "luna.heyman@proton.me";
    aliases = {
      lga = "log --graph --oneline --all --decorate";
      put = "push --set-upstream";
      rollback = "reset --hard HEAD";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = {
        decorations = "none";
        opacity = 0.95;
        padding = {
          x = 4;
          y = 4;
        };
      };

      font = {
        size = 14;
        normal = {
          family = "Iosevka Custom";
          style = "Regular";
        };
      };
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
