{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
      biblatex comment csquotes dirtytalk apacite biblatex-apa fancyvrb;
      #(setq org-latex-compiler "xelatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in
{ # home-manager
  environment.systemPackages = with pkgs; [
    tex
    texstudio
    biber
  ];
}
