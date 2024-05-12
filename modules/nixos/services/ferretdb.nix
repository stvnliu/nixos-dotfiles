{pkgs, ...}: {
  services.ferretdb = {
    enable = true;
  };
  services.postgresql = {
    enable = true;
    ensureDatabases = [
      "proteinpedia"
      "test"
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}
