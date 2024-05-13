{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      tsserver.enable = true;
      lua-ls.enable = true;
      bashls.enable = true;
      jsonls.enable = true;
      pylsp.enable = true;
      cssls.enable = true;
      java-language-server.enable = true;
    };
  };
}
