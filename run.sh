#!/bin/bash
set -ue
cd "$(dirname "$0")"
./build.sh
docker run --rm -it crossbuild
