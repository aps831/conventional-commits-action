#!/bin/sh -l
set +e
calculation_mode=$1
from_version=$2
from_reference=$3
git status
if [ "${from_version}" = "0.0.0" ]; then
  next_version="0.1.0"
else
  next_version=$(conventional_commits_next_version --calculation-mode "${calculation_mode}" --from-version "${from_version}" --from-reference "${from_reference}")
fi
echo "next-version=${next_version}" >>${GITHUB_OUTPUT}
