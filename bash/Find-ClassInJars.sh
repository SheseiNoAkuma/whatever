#!/bin/sh

here=$(pwd)

if [ -z "$1" ]; then
  echo "class to search for is required as parameter 1"
  exit 1
fi

echo "searching for class $1 in $here"


for i in *.jar; do jar -tvf "$i" | grep -Hsi "$1" && echo "found here -> $i"; done
