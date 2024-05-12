{
  nixpkgs.overlays = [
    (final: prev: {
      paperwork = prev.paperwork.overrideAttrs (old: {
        src = prev.fetchFromGitLab {
          domain = "gitlab.gnome.org";
          repo = "paperwork";
          group = "World";
          owner = "OpenPaperwork";
          rev = "abcebfe9714644d4e259e53b10e0e9417b5b864f";
          sha256 = prev.pkgs.lib.fakeSha256;
        };
      });
    })
  ];
}
