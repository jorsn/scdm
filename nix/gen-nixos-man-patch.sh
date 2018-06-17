#!/bin/sh

set -e

cd "$(dirname "$0")"

git diff ..man-nixos | sed '1,2d' > nixos-man.patch
