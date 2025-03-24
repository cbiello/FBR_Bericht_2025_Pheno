#!/bin/sh
#
#
#

# ------------------------------------------------------------------------------

if [ ! -f "FBR_Bericht_2025.tex" -a -f "FBR_Bericht_2025_2.tex" -a -f "FBR_Bericht_2025_3.tex" ]
then
    exit 21
fi

if [ ! -d "Misc" ]
then
    exit 22
else
    echo "" | ps2pdf -sPAPERSIZE=a4 - Misc/empty_page.pdf
fi

#if [ ! -d "$HOME/public_html/FBR2025" ]
#then
#    exit 23
#fi

# ------------------------------------------------------------------------------

make clean && make || exit

# ------------------------------------------------------------------------------

pdflatex FBR_Bericht_2025.tex || exit 31
biber FBR_Bericht_2025        || exit 32 
pdflatex FBR_Bericht_2025.tex || exit 33
pdflatex FBR_Bericht_2025.tex || exit 34

#cp FBR_Bericht_2025.pdf $HOME/public_html/FBR2025/ || exit 33

# ------------------------------------------------------------------------------

pdflatex FBR_Bericht_2025_2.tex || exit 41
biber FBR_Bericht_2025_2        || exit 42
pdflatex FBR_Bericht_2025_2.tex || exit 43
pdflatex FBR_Bericht_2025_2.tex || exit 44

#pdftk Misc/Deckblatt_Teil_2_neu.pdf Misc/empty_page.pdf FBR_Bericht_2025_2.pdf cat output $HOME/public_html/FBR2025/FBR_Bericht_2025_2.pdf || exit 36

# ------------------------------------------------------------------------------

pdflatex FBR_Bericht_2025_3.tex || exit 51
biber FBR_Bericht_2025_3        || exit 52
pdflatex FBR_Bericht_2025_3.tex || exit 53
pdflatex FBR_Bericht_2025_3.tex || exit 54

#pdftk Misc/Deckblatt_Teil_3_neu.pdf Misc/empty_page.pdf FBR_Bericht_2025_3.pdf cat output $HOME/public_html/FBR2025/FBR_Bericht_2025_3.pdf || exit 39

# ------------------------------------------------------------------------------

# cp FBR_Bericht_2025.pdf ~/public_html/intern/FBR2025/
# cp FBR_Bericht_2025_2.pdf ~/public_html/intern/FBR2025/
# cp FBR_Bericht_2025_3.pdf ~/public_html/intern/FBR2025/

pdftk ./Cover/Deckblatt_II_final.pdf  ./FBR_Bericht_2025_2.pdf cat output ~/public_html/intern/FBR2025/FBR_Bericht_2025_2.pdf
pdftk ./Cover/Deckblatt_III_final.pdf ./FBR_Bericht_2025_3.pdf cat output ~/public_html/intern/FBR2025/FBR_Bericht_2025_3.pdf
