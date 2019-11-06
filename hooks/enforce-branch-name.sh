#!/usr/bin/env bash
LC_ALL=C

local_branch="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex="^((feature|bugfix|improvement|prerelease|release|hotfix)\/[a-z0-9._-]+-[a-z]{3}|master|13.0|12.0|11.0|10.0|9.0|8.0|7.0|6.0|6.1|5.0)$"

message="There is something wrong with your branch name. \nBranch names in this project must adhere to this contract: \n\t$valid_branch_regex. \n\Your commit will be rejected. Please rename your branch and try again."

if [[ ! $local_branch =~ $valid_branch_regex ]]
then
    echo -e "$message"
    exit 1
fi

exit 0
