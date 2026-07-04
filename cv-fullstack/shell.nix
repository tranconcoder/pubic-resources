# Dev shell for building the CV on NixOS / any machine with Nix.
#
# Usage:
#   nix-shell            # from cv-fullstack/
#   ./convert.sh outputs/cv-fullstack.tex
#
# On older nixpkgs (< 23.11) replace `texliveMedium` with
# `texlive.combined.scheme-medium`.
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    texliveMedium # pdflatex + charter, microtype, parskip, hyperref, ...
    poppler_utils # pdftoppm (PDF -> PNG)
    pandoc        # LaTeX -> DOCX
  ];
}
