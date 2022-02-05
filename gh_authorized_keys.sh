#!/bin/bash

set -euo pipefail

if [ $# -ne 2 ]
then
  echo "usage: $0 USERNAME GITHUB_USERNAME" 1>&2
  exit 1
fi

home=$(bash -c "cd ~$(printf %q "$1") && pwd")
gh_keys=$(curl -sS https://github.com/"$2".keys)
authorized_keys_file=$home/.ssh/authorized_keys
if test -f "$authorized_keys_file"; then
  authorized_keys=$(cat "$authorized_keys_file")
else
  authorized_keys=""
fi
if [ "$gh_keys" != "$authorized_keys" ]
then
  echo "$gh_keys" > "$authorized_keys_file"
fi
