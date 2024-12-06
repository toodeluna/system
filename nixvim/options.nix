{
  programs.nixvim.opts = {
    termguicolors = true;

    wrap = false;
    scrolloff = 20;

    number = true;
    relativenumber = true;

    list = true;
    smartindent = true;
    shiftwidth = 4;
    tabstop = 4;

    swapfile = true;
    backup = false;
    undofile = false;

    hlsearch = false;
    incsearch = true;
  };
}
