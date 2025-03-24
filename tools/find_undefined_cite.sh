#!/bin/sh
#
#
#

for CITE in $(grep "LaTeX Warning: Citation" FBR_Bericht_2022.log | cut -d "'" -f 2)
do
    echo -n "Undefined \\cite{$CITE} found in "
    find . -type f -name "*.tex" -exec grep -l "$CITE" {} \; 
done
