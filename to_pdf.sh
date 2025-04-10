#!/bin/bash
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"
pushd "$SCRIPT_DIR"
rm -f mela.pdf
mkdir -p _out
find _out -name "*.pdf" -delete
find src -name "*.tex" -exec pdflatex  -interaction nonstopmode -file-line-error -output-directory _out {} \;
pdfunite _out/*.pdf mela.pdf
popd
