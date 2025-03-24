#!/bin/bash
#
#



UNTRACKED_FILES=$(git status --porcelain -uall | grep '^?? ' | sed -e 's/^?? //')

# USED_FILES=


declare -A FIG

#for FILE in `sed ':1; s/<\([^>]*\)>/(\1)/g; /</ { N; s/\n//; b 1 }' "FBR_Bericht_2022.log" | grep -Eo '[-_A-Za-z0-9.,=+/#$@]+\.(eps|pdf|png|jpg)' | sort -u`
for file in `sed ':1; s/<\([^>]*\)>/(\1)/g; /</ { N; s/\n//; b 1 }' "FBR_Bericht_2022.log" | grep -Eo '\(.*\)' | grep -Eo '[-_A-Za-z0-9.,=+/#$@]+\.(eps|pdf|png|jpg)' | sort -u`
do
  ABSPATH="`readlink -f $FILE`"
  test -z "$ABSPATH" && continue
  RELPATH="${ABSPATH#$PWD/}"
  test "$ABSPATH" = "$RELPATH" && continue
  EPS="${RELPATH%.pdf}.eps"
  test -e "$EPS" && RELPATH="$EPS"
  FIG[$RELPATH]=1
done

printf '%s\n' "${!FIG[@]}"

