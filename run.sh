#!/bin/bash
set -ue
cd "$(dirname "$0")"
./build.sh
docker run --rm -v $(pwd -P):/work -it crossbuild
