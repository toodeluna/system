{
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.plugins.neo-tree = {
    enable = true;
    extraOptions = {
      close_if_last_window = true;
      window.width = 30;
    };
  };
}
