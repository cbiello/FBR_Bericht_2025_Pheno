#!/bin/sh
#
#
#



#for TEX_FILE in $(find Theory/ -type f -name \*.tex)
#for TEX_FILE in ./LowBack/KATRIN/KATRIN.tex ./LowBack/COSINUS/cosinus.tex
do
    #echo $TEX_FILE
    perl -pi -e 's/\\section\[/\\chapter\[/g' $TEX_FILE
    perl -pi -e 's/\\section\{/\\chapter\{/g' $TEX_FILE
    perl -pi -e 's/\\subsection\[/\\section\[/g' $TEX_FILE
    perl -pi -e 's/\\subsection\{/\\section\{/g' $TEX_FILE
    perl -pi -e 's/\\subsubsection\[/\\subsection\[/g' $TEX_FILE
    perl -pi -e 's/\\subsubsection\{/\\subsection\{/g' $TEX_FILE
    perl -pi -e 's/\\paragraph\[/\\subsubsection\[/g' $TEX_FILE
    perl -pi -e 's/\\paragraph\{/\\subsubsection\{/g' $TEX_FILE
done


