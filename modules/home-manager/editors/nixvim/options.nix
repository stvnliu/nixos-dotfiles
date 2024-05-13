{...}: {
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    completeopt = ["menu" "menuone" "noselect"];
    expandtab = true;
    autoindent = true;
    undofile = true;
  };
}
