#!/bin/bash
set +e
calculation_mode=$1
from_version=$2
from_reference=$3
git status
message=$(git log -1 --pretty=%B)
if [[ ${from_version} == "0.0.0" ]]; then
  next_version="0.1.0"
elif [[ ${from_version} =~ ^"0" && ${message} =~ ^"feat: initial stable release" ]]; then
  next_version="1.0.0"
else
  next_version=$(conventional_commits_next_version --calculation-mode "${calculation_mode}" --from-version "${from_version}" --from-reference "${from_reference}")
fi
echo "next-version=${next_version}" >>${GITHUB_OUTPUT}
