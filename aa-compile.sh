#!/bin/bash
# arm64 and amd64 compile and compatibility merge
# Thanks to https://github.com/randall77/makefat.git
dest=$1
src=$2

cross-compile.sh darwin amd64 $src && \
cross-compile.sh darwin arm64 $src && \
makefat $dest binary-darwin-* && \
echo "makefat for $dest ..." && \
rm -rf binary-darwin-*



