#! /bin/bash
rm *.pdf
find . -name "*.tex" -exec pdflatex -interaction=batch {} \;
pdfunite *.pdf mela.pdf
open mela.pdf

