#!/usr/bin/env bash
# Convert a LaTeX resume/CV to PDF, PNG image(s), and Word (.docx).
#
# Usage:
#   ./convert.sh <file.tex> [pdf|png|docx|all]
#
# Examples:
#   ./convert.sh outputs/cv-fullstack.tex          # does all 3
#   ./convert.sh outputs/cv-fullstack.tex pdf       # only compile to PDF
#   ./convert.sh outputs/cv-fullstack.tex png       # PDF -> PNG page images
#   ./convert.sh outputs/cv-fullstack.tex docx      # PDF -> Word via pandoc
#
# Requires: pdflatex (texlive), pdftoppm (poppler-utils), pandoc.
# On NixOS: run `nix-shell` in this directory first (see shell.nix).

set -euo pipefail

TEX_FILE="${1:?Usage: $0 <file.tex> [pdf|png|docx|all]}"
MODE="${2:-all}"

if [[ ! -f "$TEX_FILE" ]]; then
  echo "Error: file not found: $TEX_FILE" >&2
  exit 1
fi

DIR="$(cd "$(dirname "$TEX_FILE")" && pwd)"
BASE="$(basename "$TEX_FILE" .tex)"
PDF_FILE="$DIR/$BASE.pdf"

to_pdf() {
  echo ":: Compiling $TEX_FILE -> PDF"
  ( cd "$DIR" && pdflatex -interaction=nonstopmode "$BASE.tex" >/dev/null
    pdflatex -interaction=nonstopmode "$BASE.tex" >/dev/null )
  echo "   -> $PDF_FILE"
}

to_png() {
  [[ -f "$PDF_FILE" ]] || to_pdf
  echo ":: Rendering PDF -> PNG"
  pdftoppm -png -r 150 "$PDF_FILE" "$DIR/$BASE"
  for f in "$DIR/$BASE"-*.png; do echo "   -> $f"; done
}

to_docx() {
  [[ -f "$PDF_FILE" ]] || to_pdf
  echo ":: Converting LaTeX -> Word (.docx) via pandoc"
  # Strip TeX-isms pandoc can't interpret: \hrule dimensions leak as literal
  # text, \textls (microtype) swallows its argument, and \color{} makes pandoc
  # drop the rest of the enclosing group (losing headings/tech-stack lines).
  sed -e 's/\\hrule height [0-9.]*pt/\\hrule/' \
      -e 's/\\textls\[[0-9]*\]//g' \
      -e 's/\\color{[a-zA-Z]*}//g' "$TEX_FILE" | \
    pandoc -f latex -t docx -o "$DIR/$BASE.docx"
  echo "   -> $DIR/$BASE.docx"
  echo "   (Note: pandoc converts the LaTeX source directly; custom macros/spacing"
  echo "    may render differently in Word than in the PDF. For a pixel-perfect"
  echo "    Word copy, paste content from the PDF or PNG instead.)"
}

case "$MODE" in
  pdf)  to_pdf ;;
  png)  to_png ;;
  docx) to_docx ;;
  all)  to_pdf; to_png; to_docx ;;
  *) echo "Unknown mode: $MODE (use pdf|png|docx|all)" >&2; exit 1 ;;
esac

# Clean LaTeX aux files
rm -f "$DIR/$BASE".{aux,log,out}
