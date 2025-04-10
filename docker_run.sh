#!/bin/bash
set -e
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"
DOCKER_BUILDKIT=1 docker build -t mela-pdf-tools --build-arg UID=$(id -u) --build-arg GID=$(id -g) .
docker run --rm -it -v .:/workdir --entrypoint /workdir/to_pdf.sh mela-pdf-tools



