#!/bin/sh

cd "$GITHUB_WORKSPACE"

git fetch >> /dev/null # Hide standard out of fetch to avoid cluttering log
diff=`git-clang-format --diff --commit $INPUT_BASE`
[ "$diff" = "no modified files to format" ] && exit 0
[ "$diff" = "clang-format did not modify any files" ] && exit 0

printf "\033[1mYou have introduced coding style breakages, suggested changes:\n\n"

echo "$diff" | colordiff
exit 1
