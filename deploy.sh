#!/usr/bin/env bash
set -x -u -e -o pipefail

cd "$(
    dirname "$(
        realpath "$0"
    )"
)"

if ! [ -z "$(git status --porcelain)" ]
then
    echo 'uncommitted changes'
    exit 1
fi

current_commit="$(git rev-parse HEAD)"
git branch -f deploy "$current_commit"
git push origin deploy --force
