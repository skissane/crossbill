#!/bin/bash
set -ue
cd "$(dirname "$0")"
timed() {
	local TIMEFORMAT=$'\n'"=== TOOK: %3R seconds: $1"$'\n'
	shift
	time "$@"
}
download() { timed "download $1/$2" downloadx "$@"; }
downloadx() { [[ -f docker/$2 ]] || wget -O ./docker/$2 https://ftp.gnu.org/gnu/$1/$2; }
download binutils binutils-2.43.1.tar.gz
download gcc/gcc-14.2.0 gcc-14.2.0.tar.gz
timed "docker build" docker build -t crossbuild docker/
