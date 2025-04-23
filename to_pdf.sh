#!/bin/bash
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"
pushd "$SCRIPT_DIR"
rm -f mela.pdf
rm -f examens.pdf
mkdir -p _out
find _out -name "*.pdf" -delete
find src/theorie -name "*.tex" -exec pdflatex  -interaction nonstopmode -file-line-error -output-directory _out {} \;
pdfunite _out/*.pdf mela.pdf
find _out -name "*.pdf" -delete
find src/examens -name "*.tex" -exec pdflatex  -interaction nonstopmode -file-line-error -output-directory _out {} \;
pdfunite _out/*.pdf examens.pdf
popd
