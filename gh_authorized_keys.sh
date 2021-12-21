#!/bin/bash

set -euo pipefail

if [ $# -ne 2 ]
then
  echo "usage: $0 USERNAME GITHUB_USERNAME" 1>&2
  exit 1
fi

home=$(bash -c "cd ~$(printf %q "$1") && pwd")
gh_keys=$(curl -sS https://github.com/"$2".keys)
authorized_keys=$(cat "$home"/.ssh/authorized_keys)
if [ "$gh_keys" != "$authorized_keys" ]
then
  echo "$gh_keys" > "$home"/.ssh/authorized_keys
fi
