#!/bin/sh

# Helps open a file with xdg-open from mutt in a external program without weird side effects.

base=$(basename "$1")
ext="${base##*.}"

file=$(mktemp -u --suffix=".$ext")

rm -f "$file"

cp "$1" "$file"

setsid sx-open "$file" >/dev/null 2>&1 &
