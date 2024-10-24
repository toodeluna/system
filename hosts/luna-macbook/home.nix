{ config, pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "luna";
  home.homeDirectory = "/Users/luna";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    discord
  ];

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
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
        opacity = 0.95;
        padding = {
          x = 4;
          y = 4;
        };
      };

      font = {
        size = 18;
        normal = {
          family = "Iosevka Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
