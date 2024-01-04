#!/usr/bin/env bash

set -eu

git update-index

if [ -z "$(git diff-index --cached HEAD)" ] && [ -z "${GITHOOKS_ALLOW_EMPTY_COMMIT+x}" ]; then
    echo "pre-commit ERROR No files staged for commit: set GITHOOKS_ALLOW_EMPTY_COMMIT to allow"
    exit 1
fi

## Check git markers
# doesn't run outside a Git tree, so not run on $stage
if ! git diff-index --check HEAD; then
    echo "pre-commit ERROR Whitespace or conflict marker error: fix"
    exit 1
fi

## Stage changes
stage="$(mktemp -d)"
# add final / to prefix because git does not
git checkout-index --prefix="$stage/" -a

git_dir="$(git rev-parse --path-format=absolute --git-common-dir)"
make_targets="$git_dir/hooks/pre-commit.targets"
if ! [ -f "$make_targets" ]; then
    echo "pre-commit ERROR Missing make targets in $make_targets: add"
    exit 1
fi

## Run targets
while IFS= read -r target; do
    skip_var="GITHOOKS_SKIP_$target"
    if [ -z "${!skip_var+x}" ] && ! (cd "$stage" && make "$target"); then
        echo "pre-commit ERROR Compilation error: fix before committing or set GITHOOKS_SKIP_$target to skip"
        exit 1
    fi
done < "$make_targets"

## Close curtain
rm -rf "$stage"

exit 0
