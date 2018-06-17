#!/bin/sh

set -e

cd "$(dirname "$0")"

man_branch=man-nixos
branch="$(git branch | sed -n 's/^\* //p')"
git rebase -q "$branch" "$man_branch"
git checkout -q "$branch"
git diff .."$man_branch" > nixos-man.patch
