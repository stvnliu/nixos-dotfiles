{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
      biblatex comment csquotes dirtytalk;
      #(setq org-latex-compiler "xelatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in
{ # home-manager
  home.packages = with pkgs; [
    tex
    texstudio
  ];
}
